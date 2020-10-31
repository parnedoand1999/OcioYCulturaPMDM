import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:ocio_y_cultura/models/ocioycultura_model.dart';
import 'package:ocio_y_cultura/models/ocio_model.dart';

class OcioProvider {
  final listaTipos = [
    'Categorias ocio',
    'Tipo de ocio',
    'Nombre localida',
    'Descripcion zona',
    'Id zona',
  ];

  List<OcioCultura> listaInfo = [];
  Future<List<OcioCultura>> cargarPuntos() async {
    final data =
        await rootBundle.loadString('assets/data/Resultados_EOC_es.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Ocio puntos = Ocio.fromJsonList(openDataRow);
    listaInfo = puntos.lista;
    return listaInfo;
  }
}

final ocioycultura = new OcioProvider();
