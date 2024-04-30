
// ignore_for_file: file_names

class Rutina{
  String nombreRutina;
  String musculos;
  List<bool> dias;
  // Datetime = anio - mes - dia - hora - minuto - segundo
  DateTime fechaCreacion = DateTime.now();
  DateTime fechaLimite;
  Duration tiempoRestante = Duration.zero;

  String stringTiempoRestante = "Duracion: ";

  void calcularTiempoRestante(){
    tiempoRestante = fechaLimite.difference(fechaCreacion);
    if(tiempoRestante.inDays > 365){
      stringTiempoRestante += "${tiempoRestante.inDays ~/ 365} años";
    }else if (tiempoRestante.inDays > 30){
      stringTiempoRestante += "${tiempoRestante.inDays ~/ 30} meses";
    }else{
      stringTiempoRestante += "${tiempoRestante.inDays + 1} dias";
    }
  }

  Rutina({
    required this.nombreRutina,
    required this.fechaLimite,
    required this.musculos,
    required this.dias
  });

}
