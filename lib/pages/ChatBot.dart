import 'package:flutter/material.dart';
import 'package:tekton/pages/basico.dart';
import 'package:tekton/pages/home_page.dart';

void main() => runApp(Bot());

class Bot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Bot',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  int _currentQuestionnaire = 1;
  List<String> _options = ["Estilo A", "Estilo B", "Estilo C", "Padrão"];

  @override
  void initState() {
    super.initState();
    _addBotMessage(
        'Olá! Eu sou o Bot-Tektõn. Estou aqui para ajudá-lo com seu projeto de decoração. Qual foi o resultado do seu primeiro questionário? (Estilo A, B, C ou Padrão)');
  }

  void _addBotMessage(String message) {
    setState(() {
      _messages.add({'sender': 'bot', 'message': message});
    });
  }

  void _addUserMessage(String message) {
    setState(() {
      _messages.add({'sender': 'user', 'message': message});
    });
  }

  void _sendMessage(String message) {
    _addUserMessage(message);
    _controller.clear();
    _processMessage(message);
  }

  void _processMessage(String message) {
    if (_currentQuestionnaire == 1 &&
        _options.contains(message)) {
      _addBotMessage('Qual foi o resultado do seu segundo questionário? (Estilo A, B, C ou Padrão)');
      _currentQuestionnaire = 2;
    } else if (_currentQuestionnaire == 2 &&
        _options.contains(message)) {
      _addBotMessage('Terceiro questionário:');
      _currentQuestionnaire = 3;
    } else if (_currentQuestionnaire == 3 &&
        _options.contains(message)) {
      _addBotMessage('Suas informações foram registradas com sucesso! Agora, posso ajudá-lo com seu projeto de decoração. Em breve enviaremos um email com mais detalhes do seu projeto, muito obrigado por escolher a Tektõn');
    } else {
      _addBotMessage('Desculpe, não entendi sua mensagem. Por favor, selecione uma das opções.');
    }
  }

  Widget _buildOptions() {
    return Wrap(
      spacing: 8,
      children: _options.map((option) {
        return ElevatedButton(
          onPressed: () => _sendMessage(option),
          child: Text(option),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  title: Text('Chat Bot'),
  leading: IconButton(
    icon: Icon(Icons.arrow_back), // Ícone de seta para voltar
     onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TektonHomePage()),
             ); // Retorna à TektonHomePage
    },
  ),
),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isBot = message['sender'] == 'bot';
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isBot ? Colors.grey[300] : Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(message['message'] ?? '',
                        style: TextStyle(color: isBot ? Colors.black : Colors.blue)),
                  ),
                );
              },
            ),
          ),
          if (_currentQuestionnaire <= 3) _buildOptions(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Digite sua resposta...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (text) => _sendMessage(text),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _sendMessage(_controller.text),
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 
