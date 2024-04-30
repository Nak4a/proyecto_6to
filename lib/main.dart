
import 'package:flutter/material.dart';
import 'package:proyecto_rutinas/Paginas/paginaAlimentacion.dart';
import 'DataSet.dart';
import 'package:provider/provider.dart';
import 'Paginas/apartadoRutinas/paginaRutinas.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => RutinasDataSet()),
        //ChangeNotifierProvider( create: (xd) => PopUpsRutinas()),
      ],
      child: const Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

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



  int _selectedIndex = 2;

  final List<Widget> _children = [
      const PaginaRutinas(),
      const PaginaAliementacion(),
      PaginaRutinas(),
      PaginaRutinas(),
      PaginaRutinas(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
Widget build(BuildContext context) {


  return Scaffold(
    backgroundColor: Colors.black,



    body: IndexedStack(
      index: _selectedIndex,
      children: _children,
    ),

    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 255, 145, 0),
      onTap: _onItemTapped,
      backgroundColor: const Color.fromARGB(255, 72, 0, 255),
      unselectedLabelStyle: const TextStyle(color: Colors.white),

      items: <BottomNavigationBarItem>[

        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '', // configuracion
          backgroundColor: Color.fromARGB(255, 255, 86, 2),
        ),


        const BottomNavigationBarItem(
          icon: Icon(Icons.fastfood_rounded),
          label: 'Alimentacion',
          backgroundColor: Color.fromARGB(255, 255, 2, 91),
        ),

        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Rutinas',
          backgroundColor: Color.fromARGB(255, 72, 0, 255),
        ),


        BottomNavigationBarItem(
          icon: Image.asset("images/muscle.png", scale: 17.0, color: Colors.white),
          label: 'Progreso',
          backgroundColor: const Color.fromARGB(255, 0, 255, 217),
        ),


        const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: '', // cuenta
          backgroundColor: Color.fromARGB(255, 255, 2, 2),
        ),
      ],
    ),

  );
}

}
