
import 'package:componentes/src/models/hoteles_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DetalleHotel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Hoteles mihotel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(mihotel),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 10.0),
                _posterTitulo( context, mihotel ),
              ]
            ),
          ),
        ],
      ),
    );

  }

  Widget _crearAppBar(Hoteles mihotel) {

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 180.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          mihotel.nombreHotel,
          style: TextStyle( color: Colors.white, fontSize: 18.0),
        ),
        background: FadeInImage(
          image: NetworkImage( mihotel.urlHotel ),//Deberia estar registrada la imagen en algun lugar
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration( milliseconds: 15 ),
          fit: BoxFit.cover,
        ),
      ),
    );

  }

  Widget _posterTitulo( BuildContext context, Hoteles hotel ){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox( height: 25.0),
                Text(hotel.nombreHotel, style: TextStyle( fontSize: 30.0 , fontWeight: FontWeight.bold ), overflow: TextOverflow.ellipsis,),
                SizedBox( height: 5.0),
                Text(hotel.ubicacion, style: TextStyle( fontSize: 20.0 ), textAlign: TextAlign.justify,),
                SizedBox( height: 10.0),
                Text(hotel.descripcionLarge, style: TextStyle( fontSize: 15.0 ), textAlign: TextAlign.justify,),
                SizedBox( height: 30.0),
                Text("Habitaciones", style: TextStyle( fontSize: 30.0 , fontWeight: FontWeight.bold ), overflow: TextOverflow.ellipsis,),
                SizedBox( height: 10.0),
                _tarjetasHabitaciones(hotel.idHabitaciones),
                SizedBox( height: 20.0),
              ],
            ),
          )
        ],
      ),
    );

  }

  Widget _tarjetasHabitaciones(List<HabitacionxHotel> idHab){

    return Container(
        height: 200,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {

            return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () { Navigator.pushNamed(context, 'detalleHub', arguments: idHab[index].idHab); },
                  child: FadeInImage(
                    image: NetworkImage( idHab[index].urlHab ),
                    placeholder: AssetImage('assets/img/loading.gif'),
                    fit: BoxFit.cover,
                  ),
                )
            );

          },
          itemCount: idHab.length,
          itemWidth: 300.0,
          layout: SwiperLayout.STACK,
        ),
      );
  }

}