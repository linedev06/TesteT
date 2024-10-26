import 'package:flutter/material.dart';
import 'package:tekton/pages/home_page.dart';

void main() {
  runApp(Contato());
}

class Contato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contato',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ContatoPage(),
    );
  }
}

class ContatoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato'),
        centerTitle: true,
        leading: IconButton(
    icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 0, 0, 0)), // Ícone de seta
 onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => TektonHomePage()),
  );
},
  ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Entre em Contato',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: 20),
                    buildTextFormField('Nome', Icons.person),
                    SizedBox(height: 10),
                    buildTextFormField('E-mail', Icons.email),
                    SizedBox(height: 10),
                    buildTextFormField('Telefone', Icons.phone),
                    SizedBox(height: 10),
                    buildMessageFormField(),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Enviar formulário
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Enviado com sucesso!')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Enviar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha o campo $label';
        }
        return null;
      },
    );
  }

  Widget buildMessageFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Mensagem',
        prefixIcon: Icon(Icons.message, color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      maxLines: 5,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, digite sua mensagem';
        }
        return null;
      },
    );
  }
}
