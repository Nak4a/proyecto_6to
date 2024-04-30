import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../DataSet.dart';
import 'package:provider/provider.dart';
import '../Rutina.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RutinasDataSet(),
      child: const PaginaAliementacion(),
    ),
  );
}

class PaginaAliementacion extends StatelessWidget {
  const PaginaAliementacion({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final RutinasDataSet dataSet = Provider.of<RutinasDataSet>(context);

  return Scaffold(


    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 255, 2, 91),
      centerTitle: true,
      title: const Text(
        "Alimentacion",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    ),


    body: const Center(
      child: Column(
        children: [
          Text(
            "Alimentate bien pibe!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 90.0,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
        )

    ),



  );
}

}
