import 'package:flutter/material.dart';
import 'package:tekton/pages/Modificados2.dart';

void main() {
  runApp(Modificados());
}

class Modificados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Bot - Chat 1',
      theme: ThemeData(
        dialogBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: ChatBotPage(),
    );
  }
}

class ChatBotPage extends StatefulWidget {
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  List<String> answers = [];
  int currentQuestionIndex = 0;
  String result = '';

  final List<Map<String, dynamic>> questions = [
    {
      'text': '1. Qual é o seu estilo de vida?',
      'options': [
        {'text': 'Ativo e social', 'answer': 'A'},
        {'text': 'Calmo e reservado', 'answer': 'B'},
        {'text': 'Profissional e organizado', 'answer': 'C'},
        {'text': 'Criativo e artístico', 'answer': 'D'},
      ],
    },
    {
      'text': '2. Qual é o seu orçamento para decoração?',
      'options': [
        {'text': 'Baixo', 'answer': 'A'},
        {'text': 'Médio', 'answer': 'B'},
        {'text': 'Alto', 'answer': 'C'},
        {'text': 'Não tenho um orçamento específico', 'answer': 'D'},
      ],
    },
    {
      'text': '3. Qual é o seu estilo de decoração preferido?',
      'options': [
        {'text': 'Moderno e minimalista', 'answer': 'A'},
        {'text': 'Clássico e tradicional', 'answer': 'B'},
        {'text': 'Rústico e natural', 'answer': 'C'},
        {'text': 'Eclético e colorido', 'answer': 'D'},
      ],
    },
  ];

  void answerQuestion(String answer) {
    setState(() {
      answers.add(answer);
      if (answers.length < questions.length) {
        currentQuestionIndex++;
      } else {
        result = getResult(answers);
      }
    });
  }

  String getResult(List<String> answers) {
    final estiloVida = answers[0];
    final orcamento = answers[1];
    final estiloDecoracao = answers[2];

    if (estiloVida == 'A' && orcamento == 'A' && estiloDecoracao == 'A') {
      return 'Estilo A';
    } else if (estiloVida == 'B' && orcamento == 'B' && estiloDecoracao == 'B') {
      return 'Estilo B';
    } else if (estiloVida == 'C' && orcamento == 'C' && estiloDecoracao == 'C') {
      return 'Estilo C';
    } else if (estiloVida == 'D' && orcamento == 'D' && estiloDecoracao == 'D') {
      return 'Estilo D';
    } else {
      return 'Estilo padrão';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Chat Bot - Tektõn'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFFF9A00)),
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bem-vindo ao Chat Bot da Tektõn!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                questions[currentQuestionIndex]['text'],
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              ...(questions[currentQuestionIndex]['options'] as List<Map<String, String>>).map((option) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      padding: EdgeInsets.symmetric(vertical: 12), // mantém altura uniforme
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      option['text']!,
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () => answerQuestion(option['answer']!),
                  ),
                );
              }).toList(),
              SizedBox(height: 20),
              if (result.isNotEmpty)
                Column(
                  children: [
                    Text(
                      'O estilo de casa que melhor se adapta a você é: $result',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF9A00),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          // Navegação para o próximo chat
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Modificados2()),
                          );
                        },
                        child: Text('Próximo Chat'),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}


class NextChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Próximo Chat'),
        backgroundColor: Color(0xFFFF9A00),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ao próximo chat!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Modificados2()),
                );
              },
              child: Text('Iniciar'),
            ),
          ],
        ),
      ),
    );
  }
}