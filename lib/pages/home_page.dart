import 'package:flutter/material.dart';
import 'package:tekton/components/custom_drawer.dart';
import 'package:tekton/pages/basico.dart';
import 'package:tekton/pages/models.dart';
import 'package:tekton/pages/lobby.dart';
import 'package:tekton/pages/modificados.dart';

class TektonHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 130), // Ajuste a largura conforme necessário
            Image.asset(
              'assets/images/logo_appbar.png',
              height: 70,
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255), // Cor de fundo do AppBar
      ),
       drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho com imagem e overlay
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/tekton.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.black54, // Overlay escuro
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  child: Text(
                    'Bem-vindo ao app da Tektõn!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Explore nossos projetos arquitetônicos inovadores e descubra um mundo de design criativo e inteligente.',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Usando cartões para os botões
                  _buildCardButton(context, 'Modelos Prontos', ModelsPage(), Icons.house),
                  SizedBox(height: 20),
                  _buildCardButton(context, 'Modelos Básicos', Mbasico(), Icons.handshake),
                  SizedBox(height: 20),
                  _buildCardButton(context, 'Projetos Modificados', Modificados(), Icons.build),
                  SizedBox(height: 20),
                  _buildCardButton(context, 'Projetos Personalizados', lobby(), Icons.edit),
                  SizedBox(height: 40), // Espaçamento extra para o botão de contato
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 
  // Método auxiliar para criar um cartão estilizado
  Widget _buildCardButton(BuildContext context, String label, Widget page, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        elevation: 6, // Aumentar a sombra do cartão
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Color(0xFFFF9A00), width: 1), // Borda fina
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // Cor de fundo do botão
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(icon, size: 30, color: Color(0xFFFF9A00)), // Ícone ao lado do texto
              SizedBox(width: 10), // Espaço entre o ícone e o texto
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Cor do texto
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}