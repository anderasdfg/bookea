class Hoteles {
  String nombreHotel;
  String descripcion;
  String urlHotel;
  String precio;
  String rate;
  String ubicacion;
  String descripcionLarge;
  List<HabitacionxHotel> idHabitaciones;

  Hoteles({
    this.nombreHotel,
    this.descripcion,
    this.urlHotel,
    this.precio,
    this.rate,
    this.ubicacion,
    this.descripcionLarge,
    this.idHabitaciones
  });
}

class HabitacionxHotel {
  String urlHab;
  String idHab;

  HabitacionxHotel({
    this.urlHab,
    this.idHab,
  });
}