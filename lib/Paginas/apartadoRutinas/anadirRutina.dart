import 'package:flutter/material.dart';
import 'package:proyecto_rutinas/Paginas/apartadoRutinas/paginaRutinas.dart';
import '../../DataSet.dart';
import 'package:provider/provider.dart';
import '../../Rutina.dart';

class AnadirRutinas extends StatefulWidget {
  const AnadirRutinas({Key? key}) : super(key: key);

  @override
  State<AnadirRutinas> createState() => _AnadirRutinasPageState();
}

class _AnadirRutinasPageState extends State<AnadirRutinas> {
  late TextEditingController nombreRutina;
  late TextEditingController musculosRutina;
  late DateTime fechaSeleccionada;
  late List<bool> seleccionados;

  @override
  void initState() {
    super.initState();
    nombreRutina = TextEditingController();
    musculosRutina = TextEditingController();
    fechaSeleccionada = DateTime.now();
    seleccionados = List.generate(7, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final RutinasDataSet rutinasDataSet = Provider.of<RutinasDataSet>(context);
    const Color colorMain = Color.fromARGB(255, 72, 0, 255);
    final List<String> diasSemana = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo'
    ];

    return Scaffold(

      appBar: AppBar(
        backgroundColor: colorMain,
        centerTitle: true,
        title: const Text(
          "AÑADIR RUTINA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),


      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: Column(
            children: <Widget>[



              Expanded(
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: nombreRutina,
                        decoration: const InputDecoration(labelText: 'Nombre'),

                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: musculosRutina,
                        decoration: const InputDecoration(labelText: 'Músculos'),
                      ),

                      const SizedBox(height: 20),

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
                        child: Text(
                          'Seleccionar Fecha: ${fechaSeleccionada.day}/${fechaSeleccionada.month}/${fechaSeleccionada.year}',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Días"),
                      for (int i = 0; i < diasSemana.length; i++)
                        CheckboxListTile(
                          title: Text(diasSemana[i]),
                          value: seleccionados[i],
                          activeColor: colorMain,
                          onChanged: (bool? value) {
                            setState(() {
                              seleccionados[i] = value ?? false;
                            });
                          },
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PaginaRutinas()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 241, 240, 240),
                    ),
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {

                      rutinasDataSet.nuevaRutina(

                        Rutina(
                          nombreRutina: nombreRutina.text,
                          musculos: musculosRutina.text,
                          dias: seleccionados,
                          fechaLimite: fechaSeleccionada,
                        ),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PaginaRutinas()));
                    },
                    child: const Text("Guardar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nombreRutina.dispose();
    musculosRutina.dispose();
    super.dispose();
  }
}
