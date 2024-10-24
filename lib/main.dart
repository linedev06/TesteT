import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Importar a HomePage da pasta pages

void main() {
  runApp(TektonApp());
}

class TektonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tekton App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TektonHomePage(), // Define a HomePage como a tela inicial
    );
  }
}
