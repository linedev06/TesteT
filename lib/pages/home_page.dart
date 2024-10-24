import 'package:flutter/material.dart';
import 'package:tekton/components/custom_drawer.dart';

class TektonHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Image.asset(
            'assets/images/logo_appbar.png', 
            height: 70, 
          ),
        ),
        actions: [
          Icon(Icons.notifications_off),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.signal_wifi_4_bar),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.battery_full),
          ),
        ],
      ),
      drawer: CustomDrawer(), // Usa o CustomDrawer componentizado
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Substituímos o link pela imagem local de assets
            Image.asset(
              'assets/images/tekton.jpeg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            // Adicionamos o título de Bem-vindo abaixo da imagem
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bem-vindo ao app da Tektõn!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore nossos projetos arquitetônicos inovadores e descubra um mundo de design criativo e inteligente.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  // Colocando os quatro botões empilhados verticalmente
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Modelos Prontos'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // Borda quadrada
                            side: BorderSide(
                                color: Color(0xFFFF9A00),
                                width: 2), // Cor e espessura da borda
                          ),
                          padding: EdgeInsets.symmetric(vertical: 35),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20), // Espaço entre os botões
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Modelos Básicos'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side:
                                BorderSide(color: Color(0xFFFF9A00), width: 2),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 35),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Projetos Modificados'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side:
                                BorderSide(color: Color(0xFFFF9A00), width: 2),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 35),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Projetos Personalizados'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side:
                                BorderSide(color: Color(0xFFFF9A00), width: 2),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 35),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
