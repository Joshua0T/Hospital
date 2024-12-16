import 'package:flutter/material.dart';

class Pagos extends StatefulWidget {
  const Pagos({super.key});

  @override
  _PagosState createState() => _PagosState();
}

class _PagosState extends State<Pagos> {
  // Lista de pagos realizados
  List<Map<String, String>> pagos = [
    {'paciente': 'Juan Pérez', 'monto': '\$150', 'fecha': '2024-12-10'},
    {'paciente': 'Ana Gómez', 'monto': '\$200', 'fecha': '2024-12-12'},
  ];

  // Controladores para los campos de texto
  TextEditingController pacienteController = TextEditingController();
  TextEditingController montoController = TextEditingController();
  TextEditingController fechaController = TextEditingController();

  // Función para agregar un nuevo pago
  void agregarPago() {
    if (pacienteController.text.isNotEmpty &&
        montoController.text.isNotEmpty &&
        fechaController.text.isNotEmpty) {
      setState(() {
        pagos.add({
          'paciente': pacienteController.text,
          'monto': montoController.text,
          'fecha': fechaController.text,
        });
      });
      // Limpiar los campos después de agregar
      pacienteController.clear();
      montoController.clear();
      fechaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Pagos realizados:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: pagos.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(pagos[index]['paciente']!),
                      subtitle: Text(
                          'Monto: ${pagos[index]['monto']} - Fecha: ${pagos[index]['fecha']}'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            // Campos para ingresar nuevo pago
            TextField(
              controller: pacienteController,
              decoration: const InputDecoration(
                labelText: 'Nombre del paciente',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: montoController,
              decoration: const InputDecoration(
                labelText: 'Monto del pago',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: fechaController,
              decoration: const InputDecoration(
                labelText: 'Fecha del pago',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: agregarPago,
              child: const Text('Agregar Pago'),
            ),
          ],
        ),
      ),
    );
  }
}
