import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ocio_y_cultura/screens/img_screen.dart';
import 'package:ocio_y_cultura/screens/listatipos_screen.dart';
import 'package:ocio_y_cultura/screens/listazonas_screen.dart';

class MenuWidget extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String descripZona = box.read('descripZona');
    String tipo = box.read('tipo');

    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ocio.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.business, color: Colors.green),
          title: Text('DescripZona'),
          onTap: () {
            Get.offAll(ListaZonasScreen());
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.location_city, color: Colors.green),
          title: Text('Tipos'),
          onTap: () {
            if ((descripZona != null)) {
              Get.offAll(ListaTiposScreen());
            }
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.gps_fixed, color: Colors.green),
          title: Text('Imagenes'),
          onTap: () {
            if ((descripZona != null) && (tipo != null)) {
              Get.offAll(SelectScreen());
            }
          },
        ),
        Divider(),
      ]),
    );
  }
}
