import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';
import 'package:ocio_y_cultura/screens/listatipos_screen.dart';

import 'package:ocio_y_cultura/screens/listazonas_screen.dart';
import 'package:ocio_y_cultura/screens/img_screen.dart';

import 'screens/listInformacion_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home:
          ListaZonasScreen(), // ListInformacionScreen(),// ListaTiposScreen(), //SelectScreen(),
    );
  }
}
