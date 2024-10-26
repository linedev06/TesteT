import 'package:flutter/material.dart';
import 'package:tekton/pages/lobby.dart';

void main() {
  runApp(Perfil());
}

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil do Usuário',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: UserProfilePage(),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Usuário'),
        centerTitle: true,
       leading: IconButton( 
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => lobby()),
              (route) => false, 
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Seção do Cabeçalho do Perfil
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nome do Usuário',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'email@exemplo.com',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 30),
            // Lista de Opções de Perfil
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text('Nome'),
                    subtitle: Text('Alterar nome'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showChangeDialog(context, 'Nome');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text('E-mail'),
                    subtitle: Text('Alterar e-mail'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showChangeDialog(context, 'E-mail');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.lock_outline),
                    title: Text('Senha'),
                    subtitle: Text('Alterar senha'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showChangeDialog(context, 'Senha');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_android),
                    title: Text('Número de Telefone'),
                    subtitle: Text('Alterar telefone'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showChangeDialog(context, 'Número de Telefone');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Endereço'),
                    subtitle: Text('Alterar endereço'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showChangeDialog(context, 'Endereço');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showChangeDialog(BuildContext context, String fieldName) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alterar $fieldName'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Digite o novo $fieldName'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$fieldName alterado com sucesso!')),
                );
              },
              child: Text('Salvar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}