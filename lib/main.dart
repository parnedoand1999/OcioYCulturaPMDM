import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ocio_y_cultura/screens/listatipos_screen.dart';

import 'package:ocio_y_cultura/screens/listazonas_screen.dart';
import 'package:ocio_y_cultura/screens/img_screen.dart';

import 'screens/listInformacion_screen.dart';

main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String descripZona = box.read('descripZona');
    String tipo = box.read('tipo');
    return GetMaterialApp(
        title: 'Material App',
        home: (tipo != null)
            ? SelectScreen()
            : (descripZona != null)
                ? ListaTiposScreen()
                : ListaZonasScreen() // ListInformacionScreen(),// ListaTiposScreen(), //SelectScreen(),
        );
  }
}
