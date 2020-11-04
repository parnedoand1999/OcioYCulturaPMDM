import 'package:flutter/material.dart';

import 'package:ocio_y_cultura/screens/listanombres_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ListaNombresScreen(), //ListInformacionScreen(),
    );
  }
}
