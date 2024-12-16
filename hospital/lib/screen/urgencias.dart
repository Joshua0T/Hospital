import 'package:flutter/material.dart';

class Urgencias extends StatelessWidget {
  const Urgencias({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de pacientes en urgencias
    List<Map<String, String>> pacientesEnUrgencia = [
      {'paciente': 'Juan Pérez', 'estado': 'Crítico'},
      {'paciente': 'María González', 'estado': 'Moderado'},
      {'paciente': 'Carlos López', 'estado': 'Leve'},
      {'paciente': 'Ana Rodríguez', 'estado': 'Crítico'},
      {'paciente': 'Pedro Fernández', 'estado': 'Moderado'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes en Urgencias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Pacientes en Urgencias',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: pacientesEnUrgencia.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(pacientesEnUrgencia[index]['paciente']!),
                      subtitle: Text('Estado: ${pacientesEnUrgencia[index]['estado']}'),
                      leading: Icon(
                        Icons.local_hospital,
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
