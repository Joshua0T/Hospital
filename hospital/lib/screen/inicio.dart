import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/screen/Citas.dart';
import 'package:hospital/screen/calendario.dart';
import 'package:hospital/screen/consultas.dart';
import 'package:hospital/screen/contactos.dart';
import 'package:hospital/screen/especialistas.dart';
import 'package:hospital/screen/farmacia.dart';
import 'package:hospital/screen/informacion.dart';
import 'package:hospital/screen/laboratorio.dart';
import 'package:hospital/screen/mas.dart';
import 'package:hospital/screen/pacientes.dart';
import 'package:hospital/screen/rehabilitacion.dart';
import 'package:hospital/screen/sangre.dart';
import 'package:hospital/screen/terapias.dart';
import 'package:hospital/screen/urgencias.dart';
import 'package:hospital/screen/informes.dart';
import 'package:hospital/screen/pagos.dart';


class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {


    final List<Map<String,dynamic>> menuItems = [
            {'title':'Citas medicas','icon':Icons.medical_services,'route': CitasMenu()},
            {'title':'Urgencias','icon':Icons.medical_services,'route': Urgencias()},
            {'title':'Especialistas','icon':FontAwesomeIcons.briefcaseMedical,'route': Especialistas()},
            {'title':'Farmacia','icon':FontAwesomeIcons.prescriptionBottleMedical,'route': Farmacia()},
            {'title':'Pacientes','icon':FontAwesomeIcons.faceTired,'route': Pacientes()},
            {'title':'Terapias','icon':FontAwesomeIcons.bandage,'route': Terapias()},
            {'title':'Laboratorio','icon':FontAwesomeIcons.microscope,'route': Laboratorio()},
            {'title':'Sangre','icon':FontAwesomeIcons.droplet,'route': Sangre()},
            {'title':'Rehabilitacion','icon':FontAwesomeIcons.walking,'route': Rehabilitacion()},
            {'title':'Consultas','icon':Icons.medical_services,'route': Consultas()},
            {'title':'Informes','icon':FontAwesomeIcons.fileMedical,'route': Informes()},
            {'title':'Calendario','icon':FontAwesomeIcons.calendar,'route': Calendario()},
            {'title':'Pagos','icon':FontAwesomeIcons.creditCard,'route': Pagos()},
            {'title':'Contactos','icon':FontAwesomeIcons.addressBook,'route': Contactos()},
            {'title':'Informacion','icon':FontAwesomeIcons.infoCircle,'route': Informacion()}, 
            {'title':'Mas','icon':Icons.ac_unit,'route': Mas()}, 

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
           crossAxisSpacing: 10.0,
           mainAxisSpacing: 10.0,
           childAspectRatio: 0.99,
           ),
           padding: const EdgeInsets.all(16.0),
            itemCount  :menuItems.length,
           itemBuilder:(context,index){
            final item = menuItems [index];
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => item['route'])
                  );
              },
              
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
                ),
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 50.0, color: Colors.blue,),
                    const SizedBox(height: 10.0),
                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0 , fontWeight: FontWeight.bold),
                      
                      )
                  ],
                ),
              ),
             
            );
           }      
          ),
    );
  }
}



