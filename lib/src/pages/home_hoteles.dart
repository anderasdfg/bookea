
import 'package:componentes/src/models/hoteles_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHoteles extends StatelessWidget {

  final List<Hoteles> listaHoteles = new List<Hoteles>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Hoteles en Lima'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo2(context),
          SizedBox(height: 30.0,),
          _cardTipo2(context),
          SizedBox(height: 30.0,),
          _cardTipo2(context),
          SizedBox(height: 30.0,),
          _cardTipo2(context),
          SizedBox(height: 30.0,),
          _cardTipo2(context),
          SizedBox(height: 30.0,),
          _cardTipo2(context),
        ],
      ),
    );

  }

  Widget _cardTipo2(BuildContext context){

    final card = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://img.blogs.es/anexom/wp-content/uploads/2016/08/hoteles-w.jpg'),
            placeholder: AssetImage('assets/img/loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 210,
            fit: BoxFit.cover,
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            child: _caracteristicasHotel(),
          ),
          
          Container(
            padding: EdgeInsets.symmetric( horizontal: 20.0 ),
            child: _barraPrecios(context),
          ),

          Container(
            padding: EdgeInsets.all( 20.0 ),
            child: _barraIconos(),
          ),
          
          SizedBox(height: 20.0,),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );

  }

  Widget _caracteristicasHotel(){

    return Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Row(
              children: <Widget>[

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Hotel Inca'),
                      SizedBox( height: 5.0 ),
                      Text('Muy cerca del centro'),
                    ],
                  ),
                ),

                Icon( Icons.star, color: Colors.red, size: 30.0 ),
                Text('41', style: TextStyle( fontSize: 20.0 ) )

              ],
            ),
          ),
        )
      ],
    );

  }

  Widget _barraIconos(){

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
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

  Widget _barraPrecios(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("S/. 3000" , style: TextStyle( color: Colors.green , fontSize: 20.0, fontWeight: FontWeight.bold),),
          Container(
            padding: EdgeInsets.only( left: 100.0),
            child: _botonPagar(context)
          ),
        ],
      ),
    );
  }

  Widget _botonPagar(BuildContext context){
    return Center(
      child: Container(
        child: RaisedButton(
              child: Text("Ver detalles"),
              color: Colors.blue,
              textColor: Colors.white,
              shape: StadiumBorder(),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              onPressed: ()=> Navigator.pushNamed(context, 'detalleHoteles'),
            ),
      ),
    );
  }
  
}