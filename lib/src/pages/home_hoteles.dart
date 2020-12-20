
import 'package:componentes/src/models/hoteles_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHoteles extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final List<Hoteles> listaHoteles = populateHoteles();

    return Scaffold(
      appBar: AppBar(
        title: Text('Hoteles en Lima'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo2(context,listaHoteles[0]),
          SizedBox(height: 30.0,),
          _cardTipo2(context,listaHoteles[1]),
          SizedBox(height: 30.0,),
          _cardTipo2(context,listaHoteles[2]),
          SizedBox(height: 30.0,),
          _cardTipo2(context,listaHoteles[3]),
          SizedBox(height: 30.0,),
          _cardTipo2(context,listaHoteles[4]),
          SizedBox(height: 30.0,),
        ],
      ),
    );

  }

  /*List<Widget> _listaHoteles(BuildContext context, List<Hoteles> listaHoteles) {

    List<Widget> listafinal = [];
    listaHoteles.forEach( (hotelcito) {
      
    });
  }*/

  Widget _cardTipo2(BuildContext context, Hoteles mihotel){

    final card = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          FadeInImage(
            image: NetworkImage(mihotel.urlHotel),
            placeholder: AssetImage('assets/img/loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 210,
            fit: BoxFit.cover,
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            child: _caracteristicasHotel(mihotel),
          ),
          
          Container(
            padding: EdgeInsets.symmetric( horizontal: 20.0 ),
            child: _barraPrecios(context, mihotel),
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

  Widget _caracteristicasHotel(Hoteles mihotel){

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
                      Text(mihotel.nombreHotel),
                      SizedBox( height: 5.0 ),
                      Text(mihotel.descripcion),
                    ],
                  ),
                ),

                Icon( Icons.star, color: Colors.red, size: 30.0 ),
                Text(mihotel.rate, style: TextStyle( fontSize: 20.0 ) )

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

  Widget _barraPrecios(BuildContext context, Hoteles mihotel){
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
          Text(mihotel.precio , style: TextStyle( color: Colors.green , fontSize: 20.0, fontWeight: FontWeight.bold),),
          Container(
            padding: EdgeInsets.only( left: 100.0),
            child: _botonPagar(context, mihotel)
          ),
        ],
      ),
    );
  }

  Widget _botonPagar(BuildContext context, Hoteles mihotel){
    return Center(
      child: Container(
        child: RaisedButton(
              child: Text("Ver detalles"),
              color: Colors.blue,
              textColor: Colors.white,
              shape: StadiumBorder(),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              onPressed: ()=> Navigator.pushNamed(context, 'detalleHoteles', arguments: mihotel),
            ),
      ),
    );
  }
  
  List<Hoteles> populateHoteles() {
    //Hotel 1
    List<Hoteles> lista = [];
    Hoteles hotel1 = new Hoteles();
    hotel1.nombreHotel = "Hotel Costa del Sol Wyndham";
    hotel1.descripcion = "Buenas vistas al mar";
    hotel1.urlHotel = "https://img.blogs.es/anexom/wp-content/uploads/2016/08/hoteles-w.jpg";
    hotel1.precio = "S/.300.20";
    hotel1.rate = "57";
    hotel1.ubicacion = "A 600 metros del Óvalo Gutiérrez.";
    hotel1.descripcionLarge = "Este hotel de 4 estrellas se encuentra en el aeropuerto internacional Jorge Chávez de Lima. Alberga el spa Express. La cadena hotelera Costa del Sol tiene hoteles en las 7 ciudades más importantes de Perú. El Costa del Sol Wyndham Lima Airport cuenta con habitaciones y suites cómodas con TV LCD de 40 pulgadas por cable, WiFi gratuita y baño de mármol. Además, las suites incluyen sala de estar independiente y bañera de hidromasaje.";
    
    List<HabitacionxHotel> listahh = [];
    HabitacionxHotel hh1 = new HabitacionxHotel();
    hh1.urlHab = "https://lifestyle.americaeconomia.com/sites/lifestyle.americaeconomia.com/files/styles/inline_picture/public/one-bedroom-suite_hotel20.jpg?itok=mxGXvtbS";
    hh1.idHab = "1";
    listahh.add(hh1);

    HabitacionxHotel hh2 = new HabitacionxHotel();
    hh2.urlHab = "https://lifestyle.americaeconomia.com/sites/lifestyle.americaeconomia.com/files/styles/inline_picture/public/luxury-room_hotel_21.jpg?itok=JSDcTumY";
    hh2.idHab = "2";
    listahh.add(hh2);

    HabitacionxHotel hh3 = new HabitacionxHotel();
    hh3.urlHab = "https://lifestyle.americaeconomia.com/sites/lifestyle.americaeconomia.com/files/styles/inline_picture/public/suite-at-palacio-nazarenas_hotel5.jpg?itok=0KedTFOZ";
    hh3.idHab = "3";
    listahh.add(hh3);
    
    hotel1.idHabitaciones = listahh;

    lista.add(hotel1);

    //Hotel 2
    Hoteles hotel2 = new Hoteles();
    hotel2.nombreHotel = "Hotel Lexus";
    hotel2.descripcion = "Paisajes llamativos y relajantes";
    hotel2.urlHotel = "https://image.freepik.com/foto-gratis/color-desayuno-al-aire-libre-blanco-cristal_1127-2375.jpg";
    hotel2.precio = "S/.250.20";
    hotel2.rate = "18";
    hotel2.ubicacion = "A 20 km del aeropuerto internacional Abduzcan.";
    hotel2.descripcionLarge = "El Hotel Lexus goza de una ubicación estratégica a 900 metros del parque Kennedy y ofrece alojamiento en el barrio de Miraflores de Lima. Hay conexión WiFi y desayuno gratuitos. Las habitaciones cuentan con zona de estar, baño privado y TV de pantalla plana. La suite incluye también bañera de hidromasaje y minibar. El Hotel Lexus dispone de recepción 24 horas, restaurante y bar. Además, el establecimiento proporciona servicio de lavandería por un suplemento y aparcamiento gratuito.";
    
    List<HabitacionxHotel> listahh2 = [];
    HabitacionxHotel hh4 = new HabitacionxHotel();
    hh4.urlHab = "https://lifestyle.americaeconomia.com/sites/lifestyle.americaeconomia.com/files/styles/inline_picture/public/sky-lounge-on-l49_hotel_19.jpg?itok=SM5e-Hl0";
    hh4.idHab = "4";
    listahh2.add(hh4);

    HabitacionxHotel hh5 = new HabitacionxHotel();
    hh5.urlHab = "https://lifestyle.americaeconomia.com/sites/lifestyle.americaeconomia.com/files/styles/inline_picture/public/tambo-del-inka-a-luxury_hotel10.jpg?itok=ffLmGH82";
    hh5.idHab = "5";
    listahh2.add(hh5);
    
    hotel2.idHabitaciones = listahh2;

    lista.add(hotel2);

    //Hotel 3
    Hoteles hotel3 = new Hoteles();
    hotel3.nombreHotel = "Hotel Costa del Sol Hei";
    hotel3.descripcion = "Piscinas todo el día";
    hotel3.urlHotel = "https://img.freepik.com/foto-gratis/hotel-piscina_169016-3317.jpg?size=626&ext=jpg&ga=GA1.2.674483083.1608431851";
    hotel3.precio = "S/.100.20";
    hotel3.rate = "23";
    hotel3.ubicacion = "A 7 km del Museo de la Nación";
    hotel3.descripcionLarge = "El Costa del Sol Hei se encuentra en Lima y cuenta con una magnífica piscina exterior abierta todo el año en la planta superior. Ofrece WiFi gratis y un desayuno buffet diario. Las habitaciones del Costa del Sol Hei están decoradas con buen gusto y disponen de baño privado, TV por cable, aire acondicionado y minibar. Algunas tienen terraza.";
    
    List<HabitacionxHotel> listahh3 = [];
    HabitacionxHotel hh6 = new HabitacionxHotel();
    hh6.urlHab = "https://lifestyle.americaeconomia.com/sites/lifestyle.americaeconomia.com/files/styles/inline_picture/public/kayakapi-premium-caves_hotel24.jpg?itok=gfK378AN";
    hh6.idHab = "6";
    listahh3.add(hh6);

    HabitacionxHotel hh13 = new HabitacionxHotel();
    hh13.urlHab = "https://img.freepik.com/foto-gratis/tipo-complejo-entretenimiento-popular-complejo-piscinas-parques-acuaticos-turquia-mas-5-millones-visitantes-al-ano-amara-dolce-vita-hotel-lujo-recurso-tekirova-kemer_146671-18728.jpg?size=626&ext=jpg&ga=GA1.2.674483083.1608431851";
    hh13.idHab = "13";
    listahh3.add(hh13);
    
    hotel3.idHabitaciones = listahh3;
    lista.add(hotel3);

    //Hotel 4
    Hoteles hotel4 = new Hoteles();
    hotel4.nombreHotel = "Hotel Broodmother";
    hotel4.descripcion = "Habitaciones equipadas y confortables";
    hotel4.urlHotel = "https://dam.ngenespanol.com/wp-content/uploads/2019/08/Costa-Rica-Santarena-Hotel-4.jpg";
    hotel4.precio = "S/.107.80";
    hotel4.rate = "47";
    hotel4.ubicacion = "En la zona financiera y comercial de la ciudad";
    hotel4.descripcionLarge = "El Hotel Boulevard ofrece alojamiento en el distrito de Miraflores de Lima, a 10 minutos a pie del parque Kennedy. Además, hay WiFi gratuita y se sirve un desayuno gratuito todos los días. Las habitaciones disponen de baño privado y TV por cable de pantalla plana. Las suites cuentan con bañera de hidromasaje.";
    
    List<HabitacionxHotel> listahh4 = [];
    HabitacionxHotel hh7 = new HabitacionxHotel();
    hh7.urlHab = "https://lifestyle.americaeconomia.com/sites/lifestyle.americaeconomia.com/files/styles/inline_picture/public/royal-suite_hotel8.jpg?itok=a2RqNCTx";
    hh7.idHab = "7";
    listahh4.add(hh7);

    HabitacionxHotel hh11 = new HabitacionxHotel();
    hh11.urlHab = "https://i.pinimg.com/236x/64/54/7e/64547eee10c9c6ce6bcbaad1c4f84c35.jpg";
    hh11.idHab = "11";
    listahh4.add(hh11);

    HabitacionxHotel hh12 = new HabitacionxHotel();
    hh12.urlHab = "https://images.squarespace-cdn.com/content/v1/52dfe66be4b0cad36168429a/1587052900592-S6Y5Z0CYDSAPEYZS226Z/ke17ZwdGBToddI8pDm48kBut9kQLyuH8rEDqxhTIXMVZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpydlEboHzlYH8nqOl29JRi1uOaiuzT27YPpj1jmJQ5MqUgkILokFsHROalaqEM_39M/emmme+studio+blog+paisajismo+hotel+rural+lanzarote.jpg?format=750w";
    hh12.idHab = "12";
    listahh4.add(hh12);
    
    hotel4.idHabitaciones = listahh4;
    lista.add(hotel4);

    //Hotel 5
    Hoteles hotel5 = new Hoteles();
    hotel5.nombreHotel = "Hotel Abduzcan";
    hotel5.descripcion = "Especializado en atención al cliente y promociones";
    hotel5.urlHotel = "https://www.holidayinn.cl/wp-content/uploads/2015/04/aeropuerto.jpg";
    hotel5.precio = "S/.173.80";
    hotel5.rate = "27";
    hotel5.ubicacion = "Está a 45 minutos en coche del parque central";
    hotel5.descripcionLarge = "El Ibis Larco Miraflores está situado en la avenida principal de Miraflores y cuenta con un restaurante y un bar abierto las 24 horas. Ofrece habitaciones con conexión WiFi gratuita y TV por cable a solo 3 minutos a pie del centro comercial Larcomar. Hay aparcamiento gratuito. La playa está a 500 metros. Las habitaciones del Ibis Larco están decoradas con muebles modernos de madera y suelo de parqué. Todas disponen de baño privado y aire acondicionado.";
    
    List<HabitacionxHotel> listahh5 = [];
    HabitacionxHotel hh8 = new HabitacionxHotel();
    hh8.urlHab = "https://lifestyle.americaeconomia.com/sites/lifestyle.americaeconomia.com/files/styles/inline_picture/public/cocoa-island-resort_hotel6.jpg?itok=KcPNkPs3";
    hh8.idHab = "8";
    listahh5.add(hh8);

    HabitacionxHotel hh9 = new HabitacionxHotel();
    hh9.urlHab = "https://lifestyle.americaeconomia.com/sites/lifestyle.americaeconomia.com/files/styles/inline_picture/public/shinta-mani_hotel4.jpg?itok=vZkmpI";
    hh9.idHab = "9";
    listahh5.add(hh9);

    HabitacionxHotel hh10 = new HabitacionxHotel();
    hh10.urlHab = "https://lifestyle.americaeconomia.com/sites/lifestyle.americaeconomia.com/files/styles/inline_picture/public/four-seasons-hotel-gresham_hotel4.jpg?itok=aKcqCaIb";
    hh10.idHab = "10";
    listahh5.add(hh10);
    
    hotel5.idHabitaciones = listahh5;
    lista.add(hotel5);

    return lista;
  }
}