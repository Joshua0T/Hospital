import 'package:flutter/material.dart';

class Consultas extends StatelessWidget {
  const Consultas({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de consultas médicas
    final List<Map<String, dynamic>> consultasMedicas = [
      {'titulo': 'Consulta general', 'fecha': '2024-12-20 09:00 AM', 'detalle': 'Revisión de salud general'},
      {'titulo': 'Consulta con Dermatólogo', 'fecha': '2024-12-21 10:30 AM', 'detalle': 'Revisión de piel'},
      {'titulo': 'Consulta odontológica', 'fecha': '2024-12-22 01:00 PM', 'detalle': 'Chequeo dental'},
      {'titulo': 'Consulta con especialista', 'fecha': '2024-12-23 11:00 AM', 'detalle': 'Consulta cardiológica'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas Médicas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Próximas Consultas Médicas:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: consultasMedicas.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(consultasMedicas[index]['titulo']),
                      subtitle: Text('Fecha: ${consultasMedicas[index]['fecha']}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón, mostrando el detalle de la consulta
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(consultasMedicas[index]['titulo']),
                              content: Text('Detalle: ${consultasMedicas[index]['detalle']}'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cerrar'),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text('Ver Detalles'),
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
