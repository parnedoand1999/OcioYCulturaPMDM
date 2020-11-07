import 'package:flutter/material.dart';
import 'package:ocio_y_cultura/screens/listatipos_screen.dart';

import 'package:ocio_y_cultura/screens/listazonas_screen.dart';
import 'package:ocio_y_cultura/screens/img_screen.dart';

import 'screens/listInformacion_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:
          SelectScreen(), //ListaTiposScreen(), //ListaZonasScreen(),// ListInformacionScreen(),
    );
  }
}
