import 'package:flutter/material.dart';
import 'package:proyecto_rutinas/Paginas/apartadoRutinas/paginaRutinas.dart';
import '../../DataSet.dart';
import 'package:provider/provider.dart';
import '../../Rutina.dart';

class EditarRutina extends StatefulWidget {
  const EditarRutina({Key? key}) : super(key: key);

  @override
  State<EditarRutina> createState() => _EditarRutinasPageState();
}

class _EditarRutinasPageState extends State<EditarRutina> {
  late TextEditingController _nombreRutinaController;
  late TextEditingController _musculosRutinaController;
  late DateTime _fechaSeleccionada;
  late List<bool> _seleccionados;
  final Color _colorMain = Color.fromARGB(255, 72, 0, 255);
  final List<String> _diasSemana = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo'
  ];

  @override
  void initState() {
    super.initState();
    final RutinasDataSet rutinasDataSet = Provider.of<RutinasDataSet>(context, listen: false);
    final Rutina rutina = rutinasDataSet.rutinasGuardadas[rutinasDataSet.indiceEditarRutina];
    _nombreRutinaController = TextEditingController(text: rutina.nombreRutina);
    _musculosRutinaController = TextEditingController(text: rutina.musculos);
    _fechaSeleccionada = rutina.fechaLimite;
    _seleccionados = List.from(rutina.dias);
  }

  @override
  Widget build(BuildContext context) {
    final RutinasDataSet rutinasDataSet = Provider.of<RutinasDataSet>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colorMain,
        centerTitle: true,
        title: const Text(
          "EDITAR RUTINA",
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
                        controller: _nombreRutinaController,
                        decoration: const InputDecoration(labelText: 'Nombre'),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _musculosRutinaController,
                        decoration: const InputDecoration(labelText: 'Músculos'),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: _fechaSeleccionada,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null) {
                            setState(() {
                              _fechaSeleccionada = picked;
                            });
                          }
                        },
                        child: Text(
                          'Seleccionar Fecha: ${_fechaSeleccionada.day}/${_fechaSeleccionada.month}/${_fechaSeleccionada.year}',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Días"),
                      for (int i = 0; i < _diasSemana.length; i++)
                        CheckboxListTile(
                          title: Text(_diasSemana[i]),
                          value: _seleccionados[i],
                          activeColor: _colorMain,
                          onChanged: (bool? value) {
                            setState(() {
                              _seleccionados[i] = value ?? false;
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
                      rutinasDataSet.editarRutina(
                        Rutina(
                          nombreRutina: _nombreRutinaController.text,
                          musculos: _musculosRutinaController.text,
                          dias: _seleccionados,
                          fechaLimite: _fechaSeleccionada,
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
    _nombreRutinaController.dispose();
    _musculosRutinaController.dispose();
    super.dispose();
  }
}
