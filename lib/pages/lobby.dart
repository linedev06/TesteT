import 'package:flutter/material.dart';
import 'package:tekton/pages/chat_geral.dart';
import 'package:tekton/pages/home_page.dart';
import 'package:tekton/pages/mapscreen.dart';
import 'package:tekton/pages/perfil.dart';
import 'package:tekton/pages/plantas.dart';

void main() {
  runApp(lobby());
}

class lobby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tekton App',
      theme: ThemeData(
        primaryColor: Colors.orange,
        hintColor: Colors.orangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LobbyScreen(),
    );
  }
}

class LobbyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo_appbar.png',
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ao Lobby Tektõn!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildMenuButton(context, Icons.library_books, 'Minhas Plantas'),
            SizedBox(height: 20),
            _buildMenuButton(context, Icons.map, 'Mapa'),
            SizedBox(height: 20),
            _buildMenuButton(context, Icons.chat_bubble_outline, 'Chat com Arquiteto'),
            SizedBox(height: 20),
            _buildMenuButton(context, Icons.person_outline, 'Perfil'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Ajuda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Sair',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TektonHomePage()),
            );
          }
        },
      ),
    );
  }

  // Função para construir os botões do menu
  Widget _buildMenuButton(BuildContext context, IconData icon, String label) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            // Lógica de navegação para cada botão
            if (label == 'Minhas Plantas') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlantasScreen()), // Navegação para PlantasScreen
              );
            } else if (label == 'Chat com Arquiteto') { // Corrigido para "Chat com Arquiteto"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatGeralScreen()), // Navegação para ChatGeralScreen
              );
            } else if (label == 'Perfil'){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil()),
              );

            }
          },
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 28, color: Colors.orange),
                SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
