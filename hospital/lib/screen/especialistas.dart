import 'package:flutter/material.dart';

class Especialistas extends StatelessWidget {
   Especialistas({super.key});

  // Lista de especialistas
  final List<Map<String, String>> especialistas = [
    {'nombre': 'Dr. Juan Pérez', 'especialidad': 'Cardiología'},
    {'nombre': 'Dra. María López', 'especialidad': 'Neurología'},
    {'nombre': 'Dr. Carlos García', 'especialidad': 'Ginecología'},
    {'nombre': 'Dra. Ana Martínez', 'especialidad': 'Pediatría'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Especialistas Médicos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Lista de Especialistas Médicos:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: especialistas.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(especialistas[index]['nombre']!),
                      subtitle: Text('Especialidad: ${especialistas[index]['especialidad']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.info),
                        onPressed: () {
                          // Aquí puedes navegar a una pantalla de detalles del especialista
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Detalle del Especialista'),
                                content: Text('Nombre: ${especialistas[index]['nombre']} \nEspecialidad: ${especialistas[index]['especialidad']}'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cerrar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
