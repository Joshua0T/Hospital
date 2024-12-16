import 'package:flutter/material.dart';

class Farmacia extends StatelessWidget {
   Farmacia({super.key});

  // Lista de medicamentos disponibles
  final List<Map<String, String>> medicamentos = [
    {'nombre': 'Paracetamol', 'tipo': 'Analgésico', 'cantidad': '20 mg'},
    {'nombre': 'Ibuprofeno', 'tipo': 'Antiinflamatorio', 'cantidad': '400 mg'},
    {'nombre': 'Amoxicilina', 'tipo': 'Antibiótico', 'cantidad': '500 mg'},
    {'nombre': 'Losartán', 'tipo': 'Antihipertensivo', 'cantidad': '50 mg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmacia del Hospital'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Medicamentos Disponibles:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: medicamentos.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(medicamentos[index]['nombre']!),
                      subtitle: Text('Tipo: ${medicamentos[index]['tipo']}'),
                      trailing: Text('Cantidad: ${medicamentos[index]['cantidad']}'),
                      onTap: () {
                        // Aquí puedes navegar a una pantalla de detalles del medicamento
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Detalles del Medicamento'),
                              content: Text(
                                'Nombre: ${medicamentos[index]['nombre']} \nTipo: ${medicamentos[index]['tipo']} \nCantidad: ${medicamentos[index]['cantidad']}',
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
