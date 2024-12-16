import 'package:flutter/material.dart';

class Rehabilitacion extends StatefulWidget {
  const Rehabilitacion({super.key});

  @override
  _RehabilitacionState createState() => _RehabilitacionState();
}

class _RehabilitacionState extends State<Rehabilitacion> {
  // Lista de pacientes en rehabilitación
  List<Map<String, String>> pacientesRehabilitacion = [
    {'nombre': 'Carlos García', 'diagnostico': 'Lesión en rodilla', 'fecha': '2024-12-01'},
    {'nombre': 'Laura Martínez', 'diagnostico': 'Fractura de muñeca', 'fecha': '2024-12-05'},
  ];

  // Controladores para los campos de texto
  TextEditingController nombreController = TextEditingController();
  TextEditingController diagnosticoController = TextEditingController();
  TextEditingController fechaController = TextEditingController();

  // Función para agregar un nuevo paciente
  void agregarPaciente() {
    if (nombreController.text.isNotEmpty &&
        diagnosticoController.text.isNotEmpty &&
        fechaController.text.isNotEmpty) {
      setState(() {
        pacientesRehabilitacion.add({
          'nombre': nombreController.text,
          'diagnostico': diagnosticoController.text,
          'fecha': fechaController.text,
        });
      });
      // Limpiar los campos después de agregar
      nombreController.clear();
      diagnosticoController.clear();
      fechaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes en Rehabilitación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Pacientes en rehabilitación:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: pacientesRehabilitacion.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(pacientesRehabilitacion[index]['nombre']!),
                      subtitle: Text(
                          'Diagnóstico: ${pacientesRehabilitacion[index]['diagnostico']} - Fecha: ${pacientesRehabilitacion[index]['fecha']}'),
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
              controller: diagnosticoController,
              decoration: const InputDecoration(
                labelText: 'Diagnóstico',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: fechaController,
              decoration: const InputDecoration(
                labelText: 'Fecha de inicio',
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
