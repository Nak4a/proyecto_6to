// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Rutina.dart';

// ESTE ES UN ARCHIVO DONDE SE GUARDAN TODOS
// LOS DATASETS

// UN DATASET ES UNA CLASE EN LA CUAL
// TODOS LOS WIDGETS PUEDEN ACCEDER A SUS
// DATOS (la perra)



class RutinasDataSet with ChangeNotifier {

  int indiceEditarRutina = 0;

  int selectedIndex = 2;

  final List<Rutina> rutinasGuardadas = [];

  void editarRutina(Rutina nuevaRutina){
    nuevaRutina.calcularTiempoRestante();
    rutinasGuardadas[indiceEditarRutina] = nuevaRutina;
    notifyListeners();
  }

  void nuevaRutina(Rutina nuevaRutina) {
    nuevaRutina.calcularTiempoRestante();
    rutinasGuardadas.add(nuevaRutina);
    notifyListeners(); // Notificar a los listeners que los datos han cambiado
  }



}



/*
class PopUpsRutinas extends ChangeNotifier{

  void editarRutina(BuildContext context, RutinasDataSet rutinasDataSet, int indice){
    showDialog(
          context: context,
          builder: (BuildContext context) {
              Rutina rutina = rutinasDataSet.rutinasGuardadas[indice];
              // VARIABLES PARA GUARDAR LOS DATOS DE LOS FIELDS
              // DADO QUE ESTAMOS EDITANDO, VAN A TENER EL VALOR
              // QUE YA TIENE LA RUTINA GUARDADA Y ASI SABER QUE
              // PUTA TAS EDITANDO
              TextEditingController nombreRutina = TextEditingController(text: rutina.nombreRutina);
              TextEditingController musculosRutina = TextEditingController(text: rutina.musculos);
              DateTime fechaSeleccionada = rutina.fechaLimite;

              List<String> diasSemana = ['Lunes', 'Martes', 'Miercoles',
                                          'Jueves', 'Viernes', 'Sabado', 'Domingo'];
              List<bool?> seleccionados = List.generate(7, (index) => rutina.dias[index]);

              void dispose() {
                // Liberar recursos al destruir el widget (chatsito)
                nombreRutina.dispose();
                musculosRutina.dispose();
                super.dispose();
              }

            return StatefulBuilder(
              builder: (context, setState)
              {
                return AlertDialog(
                title: const Text("Editar Rutina"),

                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                          TextField(
                            controller: nombreRutina,
                            decoration: const InputDecoration(labelText: 'Nombre'),
                          ),
                          TextField(
                            controller: musculosRutina,
                            decoration: const InputDecoration(labelText: 'Musculos'),
                          ),
                          const SizedBox(height: 20,),

                          // ====================[ SELECCIONAR FECHA ]====================
                          TextButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: fechaSeleccionada,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (picked != null && picked != fechaSeleccionada) {
                                setState(() {
                                  fechaSeleccionada = picked;
                                });
                              }
                            },
                            child: Text('Seleccionar Fecha: ${fechaSeleccionada.day}/${fechaSeleccionada.month}/${fechaSeleccionada.year}'),
                          ),

                          const SizedBox(height: 20,),
                          const Text("Dias"),
                          for (int i = 0; i < diasSemana.length; i++)
                              CheckboxListTile(
                                title: Text(diasSemana[i]),
                                value: seleccionados[i],
                                checkColor: Colors.white,
                                activeColor: const Color.fromARGB(255, 72, 0, 255),

                                onChanged: (bool? value) {
                                  setState(() {
                                    seleccionados[i] = value ?? false;
                                  });
                                }
                              ),



                    ],
                  ),
                ),
                actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancelar'),
                      ),
                      ElevatedButton(
                        child: const Text("Guardar"),
                        onPressed: (){


                          rutinasDataSet.editarRutina(
                            Rutina(
                              nombreRutina: nombreRutina.text,
                              musculos: musculosRutina.text,
                              dias: seleccionados,
                              fechaLimite: fechaSeleccionada,
                              ),
                            indice
                          );
                          Navigator.of(context).pop();

                        }
                      ),


                ],
              );
              },
            );
          }
        );
  }




// ESTO CREA EL POPUP PARA ANADIR UNA RUTINA
  void anadirRutina(BuildContext context, RutinasDataSet rutinasDataSet){
    showDialog(
          context: context,
          builder: (BuildContext context) {

              // VARIABLES PARA GUARDAR LOS DATOS DE LOS FIELDS
              TextEditingController nombreRutina = TextEditingController();
              TextEditingController musculosRutina = TextEditingController();
              DateTime fechaSeleccionada = DateTime.now();

              List<String> diasSemana = ['Lunes', 'Martes', 'Miercoles',
                                          'Jueves', 'Viernes', 'Sabado', 'Domingo'];
              List<bool?> seleccionados = List.generate(7, (index) => false);



            return StatefulBuilder(
              builder: (context, setState)
              {
                return AlertDialog(
                title: const Text("Añadir Rutina"),

                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                          TextField(
                            controller: nombreRutina,
                            decoration: const InputDecoration(labelText: 'Nombre'),
                          ),
                          TextField(
                            controller: musculosRutina,
                            decoration: const InputDecoration(labelText: 'Musculos'),
                          ),
                          const SizedBox(height: 20,),

                          // ====================[ SELECCIONAR FECHA ]====================
                          TextButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: fechaSeleccionada,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (picked != null && picked != fechaSeleccionada) {
                                setState(() {
                                  fechaSeleccionada = picked;
                                });
                              }
                            },
                            child: Text('Seleccionar Fecha: ${fechaSeleccionada.day}/${fechaSeleccionada.month}/${fechaSeleccionada.year}'),
                          ),

                          const SizedBox(height: 20,),
                          const Text("Dias"),
                          for (int i = 0; i < diasSemana.length; i++)
                              CheckboxListTile(
                                title: Text(diasSemana[i]),
                                value: seleccionados[i],
                                checkColor: Colors.white,
                                activeColor: const Color.fromARGB(255, 72, 0, 255),

                                onChanged: (bool? value) {
                                  setState(() {
                                    seleccionados[i] = value ?? false;
                                  });
                                }
                              ),



                    ],
                  ),
                ),
                actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancelar'),
                      ),
                      ElevatedButton(
                        child: const Text("Guardar"),
                        onPressed: (){


                          rutinasDataSet.nuevaRutina(
                            Rutina(
                              nombreRutina: nombreRutina.text,
                              musculos: musculosRutina.text,
                              dias: seleccionados,
                              fechaLimite: fechaSeleccionada,
                              )
                          );
                          Navigator.of(context).pop();

                        }
                      ),


                ],
              );
              },
            );
          }
        );
  }
}
*/
