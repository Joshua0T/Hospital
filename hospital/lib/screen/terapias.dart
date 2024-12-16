import 'package:flutter/material.dart';

class Terapias extends StatelessWidget {
  const Terapias({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de pacientes y sus respectivos doctores
    List<Map<String, String>> pacientesEnTerapia = [
      {'paciente': 'Juan Pérez', 'doctor': 'Dr. García'},
      {'paciente': 'María González', 'doctor': 'Dr. Martínez'},
      {'paciente': 'Carlos López', 'doctor': 'Dr. Sánchez'},
      {'paciente': 'Ana Rodríguez', 'doctor': 'Dra. Fernández'},
      {'paciente': 'Pedro Fernández', 'doctor': 'Dr. López'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes en Terapia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Pacientes que Necesitan Terapias',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: pacientesEnTerapia.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(pacientesEnTerapia[index]['paciente']!),
                      subtitle: Text('Doctor: ${pacientesEnTerapia[index]['doctor']}'),
                      leading: Icon(
                        Icons.person,
                        color: Colors.blue,
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
