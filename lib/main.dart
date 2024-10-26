
import 'package:flutter/material.dart';
import 'package:tekton/pages/home_page.dart'; // Certifique-se de importar a página correta

void main() {
  runApp(TektonApp());
}

class TektonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tektõn App',
      debugShowCheckedModeBanner: false, // Aqui
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white, // Cor de fundo padrão
        primarySwatch: Colors.orange,
        // Outros temas
      ),
      home: TektonHomePage(), // Define a HomePage como a tela inicial
    );
  }
}
