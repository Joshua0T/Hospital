import 'package:flutter/material.dart';

class Sangre extends StatelessWidget {
  const Sangre({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de tipos de sangre almacenados en el banco de sangre
    List<String> tiposDeSangre = [
      'O+',
      'O-',
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco de Sangre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Tipos de Sangre Almacenados en el Banco de Sangre',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: tiposDeSangre.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(tiposDeSangre[index]),
                      leading: Icon(
                        Icons.bloodtype,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
