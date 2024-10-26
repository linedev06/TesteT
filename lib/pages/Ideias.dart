import 'package:flutter/material.dart';
import 'package:tekton/pages/IdeiasDetalhe.dart';
import 'package:tekton/pages/home_page.dart';
import 'ideia_detalhes_page.dart';

class IdeiasPage extends StatelessWidget {
  final List<Map<String, String>> ideiasSemanais = [
    {
      'titulo': 'Casa Sustentável',
      'descricao': 'Projetos inovadores focados em sustentabilidade e economia de energia.',
      'imagem': 'images/sus.jpg',
    },
    {
      'titulo': 'Estúdio Moderno',
      'descricao': 'Espaço compacto e funcional para artistas e freelancers.',
      'imagem': 'images/studio.jpg',
    },
    {
      'titulo': 'Área de Convivência Urbana',
      'descricao': 'Projetos que promovem interação social e lazer nas cidades.',
      'imagem': 'images/area.jpg',
    },
  ];

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Ideias Semanais'),
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),  // Aqui você pode usar o ícone que preferir
        onPressed: () {
          // Navega para a TektonHomePage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TektonHomePage()),
          );
        },
      ),
    ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: ideiasSemanais.length,
        itemBuilder: (context, index) {
          final ideia = ideiasSemanais[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Color(0xFFFF9A00), width: 1),
            ),
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagem da ideia
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    ideia['imagem']!, // Chamando a imagem a partir do assets
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título da ideia
                      Text(
                        ideia['titulo']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Descrição da ideia
                      Text(
                        ideia['descricao']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 12),
                      // Botão para ver mais detalhes
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IdeiaDetalhesPage(
                                  titulo: ideia['titulo']!,
                                  descricao: ideia['descricao']!,
                                  imagem: ideia['imagem']!,
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xFFFF9A00),
                          ),
                          child: Text('Ver mais'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
