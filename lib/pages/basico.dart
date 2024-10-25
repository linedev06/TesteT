import 'package:flutter/material.dart';
import 'package:tekton/pages/home_page.dart';

void main() {
  runApp(Mbasico());
}

class Mbasico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Define HomePage como a tela inicial
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedPavimento;
  String? selectedDormitorios;
  String? selectedTerreno;
  String? selectedArea;
  String? selectedSobrado;

  double calculatePrice() {
    double price = 0;

    // Defina preços para cada tipo de pavimento
    if (selectedPavimento == 'Pavimento de Pedra') price += 100;
    if (selectedPavimento == 'Pavimento de Concreto') price += 80;
    if (selectedPavimento == 'Pavimento de Cerâmica') price += 60;
    if (selectedPavimento == 'Pavimento Intertravado') price += 90;
    if (selectedPavimento == 'Pavimento de Madeira') price += 120;

    // Defina preços para cada tipo de dormitório
    if (selectedDormitorios == '1 Quarto') price += 50;
    if (selectedDormitorios == '2 Quartos') price += 100;
    if (selectedDormitorios == '3 Quartos') price += 150;
    if (selectedDormitorios == '4 Quartos') price += 200;

    // Defina preços para tipos de terreno
    if (selectedTerreno == 'Terreno Pequeno') price += 30;
    if (selectedTerreno == 'Terreno Médio') price += 60;
    if (selectedTerreno == 'Terreno Grande') price += 90;

    // Defina preços para a área construída
    if (selectedArea == 'Até 50m²') price += 200;
    if (selectedArea == '50m² a 100m²') price += 300;
    if (selectedArea == 'Acima de 100m²') price += 500;

    // Defina preços para tipos de sobrado
    if (selectedSobrado == 'Sobrado Simples') price += 150;
    if (selectedSobrado == 'Sobrado Duplex') price += 250;
    if (selectedSobrado == 'Sobrado Triplex') price += 350;

    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center( // Use o Center para centralizar a imagem
          child: Image.asset(
            'images/logo_appbar.png',
            height: 100,
          ),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.close, color: const Color(0xFFFF9A00)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TektonHomePage()),
            ); // Navega para a TektonHomePage
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomDropdown(
              label: "Pavimentos",
              items: pavimentoOptions,
              onChanged: (value) {
                setState(() {
                  selectedPavimento = value;
                });
              },
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: "Dormitórios",
              items: dormitorioOptions,
              onChanged: (value) {
                setState(() {
                  selectedDormitorios = value;
                });
              },
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: "Terrenos",
              items: terrenoOptions,
              onChanged: (value) {
                setState(() {
                  selectedTerreno = value;
                });
              },
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: "Área Construída",
              items: areaOptions,
              onChanged: (value) {
                setState(() {
                  selectedArea = value;
                });
              },
            ),
            SizedBox(height: 16),
            CustomDropdown(
              label: "Sobrado",
              items: sobradoOptions,
              onChanged: (value) {
                setState(() {
                  selectedSobrado = value;
                });
              },
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  double price = calculatePrice();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Preço Calculado'),
                      content: Text('O preço total é: R\$ ${price.toStringAsFixed(2)}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fechar'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Calcular Preço'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Exemplos de listas de opções
  final List<String> pavimentoOptions = [
    'Pavimento de Pedra',
    'Pavimento de Concreto',
    'Pavimento de Cerâmica',
    'Pavimento Intertravado',
    'Pavimento de Madeira',
  ];

  final List<String> dormitorioOptions = [
    '1 Quarto',
    '2 Quartos',
    '3 Quartos',
    '4 Quartos',
  ];

  final List<String> terrenoOptions = [
    'Terreno Pequeno',
    'Terreno Médio',
    'Terreno Grande',
  ];

  final List<String> areaOptions = [
    'Até 50m²',
    '50m² a 100m²',
    'Acima de 100m²',
  ];

  final List<String> sobradoOptions = [
    'Sobrado Simples',
    'Sobrado Duplex',
    'Sobrado Triplex',
  ];
}

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  CustomDropdown({required this.label, required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: items.map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          )).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
