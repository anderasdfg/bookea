
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DetalleHotel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 10.0),
                _posterTitulo( context ),
              ]
            ),
          ),
        ],
      ),
    );

  }

  Widget _crearAppBar() {

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 180.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "Hotel los INCAS",
          style: TextStyle( color: Colors.white, fontSize: 18.0),
        ),
        background: FadeInImage(
          image: NetworkImage( "https://img.blogs.es/anexom/wp-content/uploads/2016/08/hoteles-w.jpg" ),//Deberia estar registrada la imagen en algun lugar
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration( milliseconds: 15 ),
          fit: BoxFit.cover,
        ),
      ),
    );

  }

  Widget _posterTitulo( BuildContext context ){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox( height: 25.0),
                Text("Los incas", style: TextStyle( fontSize: 30.0 , fontWeight: FontWeight.bold ), overflow: TextOverflow.ellipsis,),
                SizedBox( height: 5.0),
                Text("Lima, Perú", style: TextStyle( fontSize: 20.0 ), textAlign: TextAlign.justify,),
                SizedBox( height: 10.0),
                Text("Los Incas se encuentra en Miraflores (Lima), a apenas 15 minutos a pie de Parque Kennedy y Mercado indio. Tendrás tintorería o lavandería, un servicio de recepción las 24 horas y atención multilingüe a tu disposición. Se ofrece servicio de transporte al aeropuerto (ida y vuelta) de pago (disponible las 24 horas).", style: TextStyle( fontSize: 15.0 ), textAlign: TextAlign.justify,),
                SizedBox( height: 30.0),
                Text("Habitaciones", style: TextStyle( fontSize: 30.0 , fontWeight: FontWeight.bold ), overflow: TextOverflow.ellipsis,),
                SizedBox( height: 10.0),
                _tarjetasHabitaciones(),
                SizedBox( height: 20.0),
              ],
            ),
          )
        ],
      ),
    );

  }

  Widget _tarjetasHabitaciones(){

    return Container(
        height: 200,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {

            return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () { Navigator.pushNamed(context, 'detalleHub'); },
                  child: FadeInImage(
                    image: NetworkImage( "https://cf.bstatic.com/images/hotel/max1024x768/188/188154647.jpg" ),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                  ),
                )
            );

          },
          itemCount: 5,
          itemWidth: 300.0,
          layout: SwiperLayout.STACK,
        ),
      );
  }

}