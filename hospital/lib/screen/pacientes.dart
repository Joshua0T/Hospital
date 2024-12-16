import 'package:flutter/material.dart';

class Pacientes extends StatefulWidget {
  const Pacientes({super.key});

  @override
  _PacientesState createState() => _PacientesState();
}

class _PacientesState extends State<Pacientes> {
  // Lista de pacientes ingresados
  List<Map<String, String>> pacientes = [
    {'nombre': 'Juan Pérez', 'edad': '30 años'},
    {'nombre': 'Ana Gómez', 'edad': '25 años'},
  ];

  // Controladores para los campos de texto
  TextEditingController nombreController = TextEditingController();
  TextEditingController edadController = TextEditingController();

  // Función para agregar un nuevo paciente
  void agregarPaciente() {
    if (nombreController.text.isNotEmpty && edadController.text.isNotEmpty) {
      setState(() {
        pacientes.add({
          'nombre': nombreController.text,
          'edad': edadController.text,
        });
      });
      // Limpiar los campos después de agregar
      nombreController.clear();
      edadController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Pacientes ingresados:',
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
                      subtitle: Text('Edad: ${pacientes[index]['edad']}'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            // Campos para ingresar nuevo paciente
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del paciente',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: edadController,
              decoration: const InputDecoration(
                labelText: 'Edad del paciente',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: agregarPaciente,
              child: const Text('Agregar Paciente'),
            ),
          ],
        ),
      ),
    );
  }
}
