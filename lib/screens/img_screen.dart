//import 'package:castillos/models/patrimonio_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ocio_y_cultura/models/ocioycultura_model.dart';
import 'package:ocio_y_cultura/providers/ocio_providers.dart';
import 'package:ocio_y_cultura/screens/listatipos_screen.dart';
import 'package:ocio_y_cultura/widgets/menu_widget.dart';

import 'package:ocio_y_cultura/widgets/slider_widget.dart';
import 'package:ocio_y_cultura/widgets/swiper_widget.dart';

class SelectScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Imagenes de Ocio y Cultura"),
      ),
      drawer: MenuWidget(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text("Acceso al mapa"),
            _swiper(),
            SizedBox(
              height: 20.0,
            ),
            Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text("Acceso al mapa")),
            SizedBox(
              height: 20.0,
            ),
            _slider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pop(context);
          Get.offAll(ListaTiposScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _swiper() {
    return FutureBuilder(
      future: ocioycultura.cargarImgOcioCultura(
          box.read('descripZona') ?? args['descripZona'],
          box.read('tipo') ?? args['tipo']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SwiperWidget(lista: snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _slider() {
    return FutureBuilder(
      future: ocioycultura.cargarImgOcioCultura(
          box.read('descripZona') ?? args['descripZona'],
          box.read('tipo') ?? args['tipo']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SliderWidget(lista: snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
