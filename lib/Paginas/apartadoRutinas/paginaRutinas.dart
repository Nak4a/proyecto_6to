import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_rutinas/Paginas/apartadoRutinas/editarRutinas.dart';
import '../../DataSet.dart';
import 'package:provider/provider.dart';
import '../../Rutina.dart';
import 'anadirRutina.dart';

// ESTA ES LA PAGINA DONDE SE MOSTRARAN
// TODOS LOS CUADRADOS DE LAS RUTINAS

// EL FLOATINGACTIONBUTTON CREA UN
// WIDGET CON UNA APPBAR CUSTOM Y
// UN BODY DE anadirRutina.dart



void main() {
  runApp(const PaginaRutinas());
}

class PaginaRutinas extends StatelessWidget {
  const PaginaRutinas({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
Widget build(BuildContext context) {
  // VARIABLES DE LOS DATASETS
  final RutinasDataSet rutinasDataSet = Provider.of<RutinasDataSet>(context);
  Color colorMain = const Color.fromARGB(255, 72, 0, 255);

  return Scaffold(
    backgroundColor: Colors.black,

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AnadirRutinas())).then((value) {
              setState(() {}); // Esto fuerza a PaginaRutinas a reconstruirse cuando AnadirRutina se cierre
            });
        },

      ),


//=====================[ BARRA DE ARRIBA ]=====================
    appBar: AppBar(
      backgroundColor: colorMain,
      centerTitle: true,
      title: const Text(
        "RUTINAS",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    ),

//========[ CUADRADO DE CADA RUTINA ]============

    body: Center(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: rutinasDataSet.rutinasGuardadas.length,
        itemBuilder: (BuildContext context, int index) {
          Rutina rutina = rutinasDataSet.rutinasGuardadas[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
            child: Container(
                        width: 250,
                        height: 130,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 113, 112, 164), // NO CAMBIAR COLOR (NO MAIN)
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Column(
                                children: [



                                  //=========[ Nombre y musculo ]==========
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [

                                      //======[ NOMBRE ]=========
                                        Text(
                                          rutina.nombreRutina, //
                                          style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                 ),

                                        ),
                                        InkWell(
                                          onTap: () {
                                            rutinasDataSet.indiceEditarRutina = index;
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditarRutina())).then((value) {
                                              setState(() {}); // Esto fuerza a PaginaRutinas a reconstruirse cuando AnadirRutina se cierre
                                            });
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                                            child: Icon(
                                              Icons.edit,
                                              size: 20,
                                              color: Colors.white,
                                            ), // Icono de lápiz para editar
                                          ),
                                        ),
                                      // =======[ MUSCULOS ]=========
                                        Text(
                                          rutina.musculos,
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //=========[ Barra divisora ]===========
                                  const Divider(
                                    color: Colors.white,
                                    thickness: 2,
                                    indent: 7,
                                    endIndent: 7,
                                  ),

                                  //================[ Dias ]====================
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children:  [
                                       ClipOval(
                                          child: Container(
                                            color: rutina.dias[0]! ? colorMain : Colors.transparent, // Color de fondo condicional
                                            width: 27, // Ancho del contenedor
                                            height: 27, // Altura del contenedor
                                            child: const Center(
                                              child: Text(
                                                "L",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                       ClipOval(
                                          child: Container(
                                            color: rutina.dias[1]! ? colorMain : Colors.transparent, // Color de fondo condicional
                                            width: 27, // Ancho del contenedor
                                            height: 27, // Altura del contenedor
                                            child: const Center(
                                              child: Text(
                                                "M",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                       ClipOval(
                                          child: Container(
                                            color: rutina.dias[2]! ? colorMain : Colors.transparent, // Color de fondo condicional
                                            width: 27, // Ancho del contenedor
                                            height: 27, // Altura del contenedor
                                            child: const Center(
                                              child: Text(
                                                "M",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                       ClipOval(
                                          child: Container(
                                            color: rutina.dias[3]! ? colorMain : Colors.transparent, // Color de fondo condicional
                                            width: 27, // Ancho del contenedor
                                            height: 27, // Altura del contenedor
                                            child: const Center(
                                              child: Text(
                                                "J",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                       ClipOval(
                                          child: Container(
                                            color: rutina.dias[4]! ? colorMain : Colors.transparent, // Color de fondo condicional
                                            width: 27, // Ancho del contenedor
                                            height: 27, // Altura del contenedor
                                            child: const Center(
                                              child: Text(
                                                "V",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                       ClipOval(
                                          child: Container(
                                            color: rutina.dias[5]! ? colorMain : Colors.transparent, // Color de fondo condicional
                                            width: 27, // Ancho del contenedor
                                            height: 27, // Altura del contenedor
                                            child: const Center(
                                              child: Text(
                                                "S",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                       ClipOval(
                                          child: Container(
                                            color: rutina.dias[6]! ? colorMain : Colors.transparent, // Color de fondo condicional
                                            width: 27, // Ancho del contenedor
                                            height: 27, // Altura del contenedor
                                            child: const Center(
                                              child: Text(
                                                "D",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  //=========[ Duracion y Fecha de Creacion ]==========
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(18.0, 23.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          rutina.stringTiempoRestante,
                                          style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.0,
                                                 ),

                                        ),
                                        Text(
                                          "Creada: ${rutina.fechaCreacion.day}/${rutina.fechaCreacion.month}/${rutina.fechaCreacion.year}",
                                          style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold
                                                       ),
                                        ),
                                      ],
                                    ),
                                  ),




                                ],

                               ),
                    ),
          );

        },
      ),

    ),



  );
}

}
