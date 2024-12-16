import 'package:flutter/material.dart';

class Laboratorio extends StatefulWidget {
  const Laboratorio({super.key});

  @override
  _LaboratorioState createState() => _LaboratorioState();
}

class _LaboratorioState extends State<Laboratorio> {
  // Lista de muestras enviadas al laboratorio
  List<Map<String, String>> muestras = [
    {'paciente': 'Juan Pérez', 'muestra': 'Análisis de sangre'},
    {'paciente': 'Ana Gómez', 'muestra': 'Examen de orina'},
  ];

  // Controlador para el campo de texto
  TextEditingController pacienteController = TextEditingController();
  TextEditingController muestraController = TextEditingController();

  // Función para agregar una nueva muestra
  void agregarMuestra() {
    if (pacienteController.text.isNotEmpty && muestraController.text.isNotEmpty) {
      setState(() {
        muestras.add({
          'paciente': pacienteController.text,
          'muestra': muestraController.text,
        });
      });
      // Limpiar los campos después de agregar
      pacienteController.clear();
      muestraController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laboratorio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Muestras enviadas al laboratorio:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: muestras.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(muestras[index]['paciente']!),
                      subtitle: Text('Muestra: ${muestras[index]['muestra']}'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            // Campos para ingresar nueva muestra
            TextField(
              controller: pacienteController,
              decoration: const InputDecoration(
                labelText: 'Nombre del paciente',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: muestraController,
              decoration: const InputDecoration(
                labelText: 'Descripción de la muestra',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: agregarMuestra,
              child: const Text('Agregar Muestra'),
            ),
          ],
        ),
      ),
    );
  }
}
