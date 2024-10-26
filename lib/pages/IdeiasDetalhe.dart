import 'package:flutter/material.dart';

class IdeiaDetalhesPage extends StatelessWidget {
  final String titulo;
  final String descricao;
  final String imagem;

  IdeiaDetalhesPage({
    required this.titulo,
    required this.descricao,
    required this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Color.fromARGB(255, 235, 235, 235),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem ampliada do projeto
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagem,
                width: double.infinity,
                height: 300, // Altura aumentada
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Título do projeto
            Text(
              titulo,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            // Descrição detalhada
            Text(
              descricao,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16),
            // Texto de detalhes adicionais
            Text(
              'Detalhes do Projeto:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              _getDetalhes(titulo),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


  String _getDetalhes(String titulo) {
    switch (titulo) {
      case 'Casa Sustentável':
        return 'Projetada com um olhar atento para o futuro e um profundo respeito pelo meio ambiente, '
            'esta Casa Sustentável utiliza uma combinação de materiais reciclados e tecnologia de ponta para criar uma residência ecológica. '
            'Desde painéis solares para geração de energia limpa até sistemas de captação de água da chuva, cada detalhe foi cuidadosamente pensado '
            'para minimizar o impacto ambiental. A estrutura conta com grandes janelas estrategicamente posicionadas, garantindo a entrada de luz '
            'natural em todas as áreas, reduzindo o consumo de energia elétrica durante o dia. O interior, planejado para ser funcional e aconchegante, '
            'proporciona um espaço ideal para quem valoriza a natureza sem abrir mão do conforto.';
      case 'Estúdio Moderno':
        return 'Concebido para artistas, freelancers e profissionais criativos, este Estúdio Moderno é uma fusão entre praticidade e estilo contemporâneo. '
            'Compacto, porém versátil, o espaço foi otimizado ao máximo para garantir que cada metro quadrado seja aproveitado de forma inteligente. '
            'Linhas minimalistas, móveis embutidos e divisórias leves criam um ambiente amplo e adaptável a diferentes atividades, seja para pintura, '
            'escrita ou até mesmo para pequenas reuniões de trabalho. O estúdio é envolto por uma atmosfera clean e inspiradora, promovendo criatividade e foco, '
            'e inclui uma área externa para momentos de pausa e relaxamento.';
      case 'Área de Convivência Urbana':
        return 'Uma resposta inovadora às necessidades das cidades modernas, esta Área de Convivência Urbana é um projeto multifuncional que convida pessoas '
            'de todas as idades a se reunirem em um ambiente acolhedor e estimulante. Combinando áreas de descanso, playgrounds, pequenos quiosques e espaços '
            'de coworking ao ar livre, a estrutura foi pensada para revitalizar a interação social e oferecer uma alternativa ao cotidiano acelerado das cidades. '
            'Plantas nativas foram cuidadosamente integradas ao espaço, criando um ecossistema verde e amigável aos pedestres, enquanto a disposição aberta '
            'incentiva o convívio em um ambiente seguro e acessível para todos.';
      default:
        return 'Descrição detalhada do projeto não disponível.';
    }
  }
}
