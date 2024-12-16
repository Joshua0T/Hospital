import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Para realizar llamadas

class Contactos extends StatelessWidget {
   Contactos({super.key});

  // Lista de contactos
  final List<Map<String, String>> contactos = [
    {'nombre': 'Dr. Juan Pérez', 'telefono': '123-456-7890'},
    {'nombre': 'Dra. María López', 'telefono': '098-765-4321'},
    {'nombre': 'Dr. Carlos García', 'telefono': '555-123-4567'},
    {'nombre': 'Dra. Ana Martínez', 'telefono': '444-321-7654'},
  ];

  // Función para realizar la llamada
  Future<void> _llamar(String telefono) async {
    final Uri url = Uri(scheme: 'tel', path: telefono); // Usamos Uri
    if (await canLaunchUrl(url)) {
      await launchUrl(url); // Usamos launchUrl
    } else {
      throw 'No se puede realizar la llamada a $telefono';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos Médicos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Lista de Contactos Médicos:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: contactos.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(contactos[index]['nombre']!),
                      subtitle: Text('Teléfono: ${contactos[index]['telefono']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.call),
                        onPressed: () {
                          _llamar(contactos[index]['telefono']!);
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

