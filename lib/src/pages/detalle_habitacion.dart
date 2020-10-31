
import 'package:componentes/src/models/detalle_hab_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DetalleHab extends StatelessWidget {

  //final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
  final DetalleHabitacion detalleH = new DetalleHabitacion();

  @override
  Widget build(BuildContext context) {

    detalleH.habitacionTitulo = "Habitacion 301";
    detalleH.descripcion = "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500.";

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar( detalleH ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 10.0),
                _posterTitulo( context, detalleH ),
                _caracteristicasG( detalleH ),
                _descripcion( detalleH ),
                SizedBox( height: 20.0),
                _tarjetasHabitaciones(),
                SizedBox( height: 20.0),
                _botonPagar(),
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
      expandedHeight: 180.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          det.habitacionTitulo,
          style: TextStyle( color: Colors.white, fontSize: 18.0),
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
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        det.descripcion,
        style: TextStyle( fontSize: 12.0 ), textAlign: TextAlign.justify
      ),
    );

  }

  Widget _caracteristicasG( DetalleHabitacion det ) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Características generales", style: TextStyle( fontSize: 16.0 , fontWeight: FontWeight.bold) , overflow: TextOverflow.ellipsis,),
          SizedBox( height: 10.0,),
          _barraIconos()
        ],
      ),
    );

  }

  Widget _posterTitulo( BuildContext context, DetalleHabitacion detHab ){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage( "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQAItQPrAGjli0mKCMkr5EPbEj1coK5ATHs1Q&usqp=CAU" ),
                height: 150.0,
              ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(detHab.habitacionTitulo, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis,),
                SizedBox( height: 5.0),
                Text(detHab.descripcion, style: TextStyle( fontSize: 12.0 ), textAlign: TextAlign.justify,),
              ],
            ),
          )
        ],
      ),
    );

  }

  Widget _barraIconos(){

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon( Icons.wifi , size: 40.0),
          ),
          SizedBox( width: 25.0,),
          Container(
            child: Icon( Icons.traffic , size: 40.0),
          ),
          SizedBox( width: 25.0,),
          Container(
            child: Icon( Icons.computer , size: 40.0),
          ),
          SizedBox( width: 25.0,),
          Container(
            child: Icon( Icons.contact_phone , size: 40.0),
          ),
          SizedBox( width: 25.0,),
          Container(
            child: Icon( Icons.credit_card , size: 40.0),
          ),
        ],
      ),
    );
  }

  Widget _tarjetasHabitaciones(){
    /*return Expanded(
      child: Container(
        height: 200,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "https://webbox.imgix.net/images/tkzintxirlbyxpfq/aab785f4-e980-4f6f-a6b3-85c2cf5743d3.jpg?auto=format,compress&fit=crop&crop=entropy&w=600&h=450",
              fit: BoxFit.fitHeight,
            );
          },
          itemCount: 5,
          itemWidth: 300.0,
          layout: SwiperLayout.STACK,
        ),
      )
    );*/

    return Container(
        height: 200,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "https://webbox.imgix.net/images/tkzintxirlbyxpfq/aab785f4-e980-4f6f-a6b3-85c2cf5743d3.jpg?auto=format,compress&fit=crop&crop=entropy&w=600&h=450",
              fit: BoxFit.fitHeight,
            );
          },
          itemCount: 5,
          itemWidth: 300.0,
          layout: SwiperLayout.STACK,
        ),
      );
  }

  Widget _botonPagar(){
    return Center(
      child: Container(
        width: 300.0,
        height: 50.0,
        child: RaisedButton(
              child: Text("Reservar por S/.240"),
              color: Colors.blue,
              textColor: Colors.white,
              shape: StadiumBorder(),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              onPressed: () {},
            ),
      ),
    );
  }
}