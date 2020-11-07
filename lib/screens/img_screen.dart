//import 'package:castillos/models/patrimonio_model.dart';

import 'package:flutter/material.dart';
import 'package:ocio_y_cultura/providers/ocio_providers.dart';
import 'package:ocio_y_cultura/widgets/slider_widget.dart';
import 'package:ocio_y_cultura/widgets/swiper_widget.dart';

class SelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Imagenes de Ocio y Cultura"),
        ),
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
        ));
  }

  Widget _swiper() {
    return FutureBuilder(
      future:
          ocioycultura.cargarImgOcioCultura("La Ribera", "Museos / Artístico"),
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
      future:
          ocioycultura.cargarImgOcioCultura("La Ribera", "Museos / Artístico"),
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
