
import 'package:componentes/src/models/detalle_hab_model.dart';
import 'package:flutter/material.dart';

class DetalleHab extends StatelessWidget {

  //final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
  final DetalleHabitacion detalleH = new DetalleHabitacion();

  @override
  Widget build(BuildContext context) {

    detalleH.habitacionTitulo = "Habitacion 301";
    detalleH.descripcion = "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas 'Letraset', las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.";

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar( detalleH ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 10.0),
                _descripcion( detalleH ),
                _descripcion( detalleH ),
                _descripcion( detalleH ),
                _descripcion( detalleH ),
                _descripcion( detalleH )
              ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearAppBar( DetalleHabitacion det ) {

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          det.habitacionTitulo,
          style: TextStyle( color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage( "https://cf.bstatic.com/images/hotel/max1024x768/188/188154647.jpg" ),//Deberia estar registrada la imagen en algun lugar
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration( milliseconds: 15 ),
          fit: BoxFit.cover,
        ),
      ),
    );

  }

  Widget _descripcion( DetalleHabitacion det ) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        det.descripcion,
        textAlign: TextAlign.justify,
      ),
    );

  }
}