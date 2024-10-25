import 'package:flutter/material.dart';

void main() {
  runApp(plantas());
}

class plantas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tekton App',
      theme: ThemeData(
        primaryColor: Colors.orange,
        hintColor: Colors.orangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlantasScreen(),
    );
  }
}

class PlantasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tekton App'),
        actions: [
          IconButton(icon: Icon(Icons.help_outline), onPressed: () {}),
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Minhas Plantas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20), // Espaçamento abaixo do título
            _buildPlantCard('Planta 1', context),
            SizedBox(height: 10), // Espaçamento entre as plantas
            _buildPlantCard('Planta 2', context),
            SizedBox(height: 10), // Espaçamento entre as plantas
            _buildPlantCard('Planta 3', context),
            SizedBox(height: 20), // Espaço abaixo das plantas
            Text(
              'Progresso do Projeto',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: 0.8, // Progresso do projeto (exemplo)
              backgroundColor: Colors.grey[300],
              color: Colors.orange,
              minHeight: 10,
            ),
            SizedBox(height: 20), // Espaçamento abaixo do progresso
            Text(
              'Conquistas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildAchievementButton('Primeira Planta Adquirida'),
                SizedBox(width: 10), // Espaço entre os botões de conquistas
                _buildAchievementButton('Projeto Concluído'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantCard(String plantName, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(plantName, style: TextStyle(fontSize: 18)),
        trailing: ElevatedButton(
          onPressed: () {
            // Ação de visualização da planta
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.orange,
          ),
          child: Text('Visualizar'),
        ),
      ),
    );
  }

  Widget _buildAchievementButton(String label) {
    return ElevatedButton(
      onPressed: () {
        // Ação para conquistas
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent,
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(label),
    );
  }
}
