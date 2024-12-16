import 'package:flutter/material.dart';

class CitasMenu extends StatelessWidget {
  const CitasMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de citas médicas
    final List<Map<String, dynamic>> citasMedicas = [
      {'titulo': 'Cita con Dr. Pérez', 'fecha': '2024-12-20 10:00 AM', 'detalle': 'Consulta general'},
      {'titulo': 'Chequeo de rutina', 'fecha': '2024-12-22 11:30 AM', 'detalle': 'Revisión de salud'},
      {'titulo': 'Terapia física', 'fecha': '2024-12-23 02:00 PM', 'detalle': 'Recuperación de lesión'},
      {'titulo': 'Cita con especialista', 'fecha': '2024-12-24 09:00 AM', 'detalle': 'Consulta dermatológica'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Citas Médicas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Próximas Citas Médicas:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: citasMedicas.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(citasMedicas[index]['titulo']),
                      subtitle: Text('Fecha: ${citasMedicas[index]['fecha']}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón, mostrando el detalle de la cita
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(citasMedicas[index]['titulo']),
                              content: Text('Detalle: ${citasMedicas[index]['detalle']}'),
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
