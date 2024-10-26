import 'package:flutter/material.dart';
import 'package:tekton/pages/FinalChat.dart';

void main() {
  runApp(Modificados2());
}

class Modificados2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Bot - Chat 2',
      home: ChatBotScreen(),
    );
  }
}

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  List<String> answers = [];
  int currentQuestionIndex = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'text': '1. Qual é o estilo do seu jardim?',
      'options': [
        {'text': 'Jardim tropical', 'answer': 'A'},
        {'text': 'Jardim inglês', 'answer': 'B'},
        {'text': 'Jardim desértico', 'answer': 'C'},
        {'text': 'Jardim contemporâneo', 'answer': 'D'},
      ],
    },
    {
      'text': '2. Qual é o tamanho do seu espaço externo?',
      'options': [
        {'text': 'Pequeno', 'answer': 'A'},
        {'text': 'Médio', 'answer': 'B'},
        {'text': 'Grande', 'answer': 'C'},
        {'text': 'Muito grande', 'answer': 'D'},
      ],
    },
    {
      'text': '3. Quais elementos você gostaria de incluir no seu espaço externo?',
      'options': [
        {'text': 'Piscina', 'answer': 'A'},
        {'text': 'Área de churrasco', 'answer': 'B'},
        {'text': 'Jardim de ervas', 'answer': 'C'},
        {'text': 'Área de estar ao ar livre', 'answer': 'D'},
      ],
    },
    {
      'text': '4. Qual é a sua preferência de iluminação externa?',
      'options': [
        {'text': 'Luzes suaves e difusas', 'answer': 'A'},
        {'text': 'Iluminação focal', 'answer': 'B'},
        {'text': 'Iluminação colorida', 'answer': 'C'},
        {'text': 'Iluminação minimalista', 'answer': 'D'},
      ],
    },
    {
      'text': '5. Como você planeja usar o seu espaço externo durante o dia?',
      'options': [
        {'text': 'Relaxamento e lazer', 'answer': 'A'},
        {'text': 'Atividades de entretenimento', 'answer': 'B'},
        {'text': 'Cultivo de plantas', 'answer': 'C'},
        {'text': 'Trabalho ao ar livre', 'answer': 'D'},
      ],
    },
  ];

  void addAnswer(String answer) {
    setState(() {
      answers.add(answer);
      if (answers.length < questions.length) {
        currentQuestionIndex = answers.length;
      } else {
        final result = getResult(answers);
        showResult(result);
      }
    });
  }

  void showResult(String result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
        content: Text("O estilo de casa que melhor se adapta a você é: $result"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Final()),
              );
            },
            child: Text("Próximo Chat"),
          ),
        ],
      ),
    );
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
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Bot - Chat 2'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffff9a00)),
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem-vindo ao Chat Bot da Tektõn!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
               SizedBox(height: 10),
Text(
  currentQuestion['text'],
  style: TextStyle(fontSize: 16),
),
...currentQuestion['options'].map<Widget>((option) => Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => addAnswer(option['answer']),
          child: Text(option['text']),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    )).toList(),

                ],
              ),
            
            ),
          ],
        ),
      ),
    );
  }
}

// Apenas uma nova tela de exemplo para o próximo chat
class Chat3creen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Bot - Chat 3'),
      ),
      body: Center(
        child: Text('Bem-vindo ao Chat 3!'),
      ),
    );
  }
}
