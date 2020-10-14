import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider(){
    cargarData();
      }
    
      void cargarData() {
        rootBundle.loadString('data/menu_opts.json')
          .then((data) {
            print(data);
          });
      }
}


final menuProvider = new _MenuProvider();