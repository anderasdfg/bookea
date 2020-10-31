import 'package:componentes/src/pages/detalle_habitacion.dart';
import 'package:componentes/src/pages/detalle_hotel.dart';
import 'package:componentes/src/pages/home_hoteles.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      initialRoute: 'listaHoteles',
      routes: {
        '/'       : ( BuildContext context ) => HomePage(),
        'detalleHub' : ( BuildContext context ) => DetalleHab(),
        'listaHoteles' : ( BuildContext context ) => HomeHoteles(),
        'detalleHoteles' : ( BuildContext context ) => DetalleHotel(),
      },
    );
  }
}