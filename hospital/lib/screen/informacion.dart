import 'package:flutter/material.dart';

class Informacion extends StatelessWidget {
   Informacion({super.key});

  // Lista de pacientes con su información
  final List<Map<String, String>> pacientes = [
    {'nombre': 'Juan Pérez', 'edad': '35', 'diagnostico': 'Gripe'},
    {'nombre': 'Ana Gómez', 'edad': '28', 'diagnostico': 'Dolor abdominal'},
    {'nombre': 'Carlos Sánchez', 'edad': '45', 'diagnostico': 'Hipertensión'},
    {'nombre': 'Marta Rodríguez', 'edad': '60', 'diagnostico': 'Diabetes tipo 2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información de Pacientes'),
        titleTextStyle: TextStyle(color: Colors.redAccent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Información de los Pacientes:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: pacientes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(pacientes[index]['nombre']!),
                      subtitle: Text('Edad: ${pacientes[index]['edad']} años'),
                      trailing: Text('Diagnóstico: ${pacientes[index]['diagnostico']}'),
                      onTap: () {
                        // Mostrar más detalles de cada paciente en un cuadro de diálogo
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Detalles del Paciente'),
                              content: Text(
                                'Nombre: ${pacientes[index]['nombre']} \nEdad: ${pacientes[index]['edad']} años \nDiagnóstico: ${pacientes[index]['diagnostico']}',
                              ),
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
