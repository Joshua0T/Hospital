import 'package:flutter/material.dart';

class Informes extends StatelessWidget {
   Informes({super.key});

  // Lista de informes de pacientes
  final List<Map<String, String>> informes = [
    {'paciente': 'Juan Pérez', 'informe': 'Gripe leve, tratamiento con paracetamol y descanso.'},
    {'paciente': 'Ana Gómez', 'informe': 'Dolor abdominal, posible gastritis, se recomienda dieta blanda y consulta de seguimiento.'},
    {'paciente': 'Carlos Sánchez', 'informe': 'Hipertensión controlada con medicamentos, seguimiento mensual.'},
    {'paciente': 'Marta Rodríguez', 'informe': 'Diabetes tipo 2, tratamiento con insulina y monitoreo de glucosa.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informes de Pacientes'),
        titleTextStyle: TextStyle(color: Colors.redAccent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Informes médicos de los pacientes:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: informes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(informes[index]['paciente']!),
                      subtitle: Text('Informe: ${informes[index]['informe']}'),
                      onTap: () {
                        // Mostrar más detalles de cada informe en un cuadro de diálogo
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Informe Completo'),
                              content: Text(
                                'Paciente: ${informes[index]['paciente']} \n\nInforme: ${informes[index]['informe']}',
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
