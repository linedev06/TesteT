import 'package:flutter/material.dart';
import 'package:tekton/pages/ChatBot.dart';

void main() {
  runApp(Final());
}

class Final extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Bot - Chat 1',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> answers = [];
  int currentQuestionIndex = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'text': '1. Que tipo de móveis você prefere?',
      'options': [
        {'text': 'Móveis modernos', 'answer': 'A'},
        {'text': 'Móveis antigos', 'answer': 'B'},
        {'text': 'Móveis rústicos', 'answer': 'C'},
        {'text': 'Móveis contemporâneos', 'answer': 'D'},
      ],
    },
    {
      'text': '2. Qual é o seu orçamento para móveis?',
      'options': [
        {'text': 'Baixo', 'answer': 'A'},
        {'text': 'Médio', 'answer': 'B'},
        {'text': 'Alto', 'answer': 'C'},
        {'text': 'Não tenho um orçamento específico', 'answer': 'D'},
      ],
    },
    {
      'text': '3. Qual é o seu espaço disponível para mobília?',
      'options': [
        {'text': 'Pequeno', 'answer': 'A'},
        {'text': 'Médio', 'answer': 'B'},
        {'text': 'Grande', 'answer': 'C'},
        {'text': 'Muito grande', 'answer': 'D'},
      ],
    },
    {
      'text': '4. Quais são as cores preferidas para sua mobília?',
      'options': [
        {'text': 'Neutras (branco, cinza, bege)', 'answer': 'A'},
        {'text': 'Tons de madeira natural', 'answer': 'B'},
        {'text': 'Cores vivas e vibrantes', 'answer': 'C'},
        {'text': 'Paleta de cores variadas', 'answer': 'D'},
      ],
    },
    {
      'text': '5. Você tem alguma preferência por materiais de móveis?',
      'options': [
        {'text': 'Madeira', 'answer': 'A'},
        {'text': 'Metal', 'answer': 'B'},
        {'text': 'Vidro', 'answer': 'C'},
        {'text': 'Plástico', 'answer': 'D'},
      ],
    },
  ];

  void selectOption(String answer) {
    setState(() {
      answers.add(answer);
      currentQuestionIndex++;

      if (currentQuestionIndex >= questions.length) {
        final result = getResult(answers);
        _showResultDialog(result);
      }
    });
  }

  void _showResultDialog(String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado'),
          content: Text('O estilo de casa que melhor se adapta a você é: $result'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bot()),
                );
              },
              child: Text('Próximo'),
            ),
          ],
        );
      },
    );
  }

  String getResult(List<String> answers) {
    if (answers[0] == 'A' && answers[1] == 'A' && answers[2] == 'A') {
      return 'Estilo A';
    } else if (answers[0] == 'B' && answers[1] == 'B' && answers[2] == 'B') {
      return 'Estilo B';
    } else if (answers[0] == 'C' && answers[1] == 'C' && answers[2] == 'C') {
      return 'Estilo C';
    } else if (answers[0] == 'D' && answers[1] == 'D' && answers[2] == 'D') {
      return 'Estilo D';
    } else {
      return 'Estilo padrão';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Bot - Chat 1'),
      ),
      body: Center(
        child: currentQuestionIndex < questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Bem-vindo ao Chat Bot da Tektõn!',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          questions[currentQuestionIndex]['text'],
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ...questions[currentQuestionIndex]['options']
    .map<Widget>((option) => SizedBox(
          width: double.infinity, // largura cheia
          child: ElevatedButton(
            onPressed: () => selectOption(option['answer']),
            child: Text(option['text']),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                    )
            ),
          ),
        ))
    .toList(),

                      ],
                    ),
                  ),
                 
                ],
              )
            : Container(),
      ),
    );
  }
}
