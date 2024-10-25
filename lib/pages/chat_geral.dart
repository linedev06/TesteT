import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatGeralScreen extends StatefulWidget {
  const ChatGeralScreen({super.key});

  @override
  _ChatGeralScreenState createState() => _ChatGeralScreenState();
}

class _ChatGeralScreenState extends State<ChatGeralScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;
  final List<List<Widget>> _chats = [[], [], []]; // Um chat separado para cada arquiteto
  int _selectedArchitect = 0; // Índice do arquiteto selecionado
  String? _fileName;
  bool _isDrawerOpen = false; // Controle do Drawer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF9A00), // Cor laranja do topo
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu), // Botão de menu para mostrar/esconder a barra lateral
          onPressed: () {
            setState(() {
              _isDrawerOpen = !_isDrawerOpen;
            });
          },
        ),
        title: const Text(
          'Chat',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.phone), // Ícone de telefone
            onPressed: _makeCall, // Chama a função para fazer a ligação
          ),
        ],
      ),
      body: Row(
        children: [
          if (_isDrawerOpen) _buildSidebar(), // Mostra ou esconde o Drawer
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _chats[_selectedArchitect].length,
                        itemBuilder: (context, index) {
                          return _chats[_selectedArchitect][index];
                        },
                      ),
                    ),
                    _buildMessageInput(),
                  ],
                ),
                if (_image != null || _fileName != null)
                  _buildSelectedFilePreview(), // Pré-visualização de arquivos
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para criar a barra lateral
  Widget _buildSidebar() {
    return Container(
      width: 200,
      color: const Color.fromARGB(255, 255, 255, 255), // Cor de fundo clara
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/logo_appbar.png', // Certifique-se de que o caminho está correto
                  height: 300, // Defina a altura da imagem conforme necessário
                  fit: BoxFit.contain, // Ajuste como a imagem deve ser dimensionada
                ),
                const SizedBox(height: 1),
              ],
            ),
          ),
          _buildArchitectButton('Arquiteto 1', 0),
          _buildArchitectButton('Arquiteto 2', 1),
          _buildArchitectButton('Arquiteto 3', 2),
          const Divider(),
          _buildChannelButton('#Geral'),
          _buildChannelButton('#Random'),
          _buildChannelButton('#Voice-chat'),
          const Spacer(), // Para empurrar o botão para a parte inferior
          _buildBackButton(), // Adicionando o botão "Voltar para o Lobby"
        ],
      ),
    );
  }

  // Método para criar o botão "Voltar para o Lobby"
  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context); // Volta para a tela anterior
        },
        child: const Text('Voltar'),
      ),
    );
  }

  Widget _buildArchitectButton(String name, int index) {
    return ListTile(
      title: Text(name),
      selected: _selectedArchitect == index, // Realça o arquiteto selecionado
      onTap: () {
        setState(() {
          _selectedArchitect = index; // Altera o chat de acordo com o arquiteto selecionado
          _isDrawerOpen = false; // Fecha o Drawer
        });
      },
    );
  }

  Widget _buildChannelButton(String channel) {
    return ListTile(
      title: Text(channel),
      onTap: () {
        // Lógica para mudar de canal (se necessário)
      },
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: _pickImageFromCamera,
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Escreva sua mensagem...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedFilePreview() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 80,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_image != null) ...[
              Image.file(
                _image!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ] else if (_fileName != null) ...[
              const Icon(Icons.attach_file, color: Colors.white, size: 40),
              Text(
                'Arquivo selecionado: $_fileName',
                style: const TextStyle(color: Colors.white),
              ),
            ],
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _image = null;
                    _fileName = null;
                  });
                },
                child: const Text('Remover'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageFromCamera() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
          _fileName = null;
        });
      }
    } else if (status.isDenied) {
      final result = await Permission.camera.request();

      if (result.isGranted) {
        final pickedFile = await _picker.pickImage(source: ImageSource.camera);

        if (pickedFile != null) {
          setState(() {
            _image = File(pickedFile.path);
            _fileName = null;
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permissão para acessar a câmera negada')),
        );
      }
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Permissão permanentemente negada. Abra as configurações para concedê-la.',
          ),
        ),
      );
      openAppSettings();
    }
  }

  void _sendMessage() {
    final message = _messageController.text.trim();

    if (message.isNotEmpty || _image != null || _fileName != null) {
      setState(() {
        _chats[_selectedArchitect].add(
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 209, 141, 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (_image != null) ...[
                    Image.file(_image!),
                    const SizedBox(height: 8),
                  ],
                  if (_fileName != null) ...[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.attach_file, size: 20),
                        const SizedBox(width: 4),
                        Text(_fileName!),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (message.isNotEmpty) Text(message),
                ],
              ),
            ),
          ),
        );
        _messageController.clear();
        _image = null;
        _fileName = null;
      });
    }
  }

  void _makeCall() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ligar para o arquiteto'),
          content: const Text('Deseja ligar para o arquiteto selecionado?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Aqui você poderia usar uma biblioteca para realizar chamadas
                // Ou abrir o app de chamadas nativo do dispositivo
                Navigator.pop(context);
              },
              child: const Text('Ligar'),
            ),
          ],
        );
      },
    );
  }
}
