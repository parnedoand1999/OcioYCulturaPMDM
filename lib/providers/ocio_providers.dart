import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:ocio_y_cultura/models/ocioycultura_model.dart';
import 'package:ocio_y_cultura/models/ocio_model.dart';

class OcioProvider {
  List<OcioCultura> listaInfo = [];
  List<String> listazonas = [];
  List<String> listaTipos = [];
  List<OcioCultura> _imgOcioCultura = [];
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

  Future<List<String>> cargarZonas() async {
    if (listaInfo.length == 0) {
      await cargarPuntos();
    }
    listazonas = [];
    listaInfo.forEach((pr) {
      if (listazonas.indexOf(pr.descripZona) < 0) {
        listazonas.add(pr.descripZona);
      }
    });
    return listazonas;
  }

  Future<List<String>> cargarTipos(String descripZona) async {
    if (listaInfo.length == 0) {
      await cargarPuntos();
    }
    listaTipos = [];
    listaInfo.forEach((pr) {
      if ((pr.descripZona == descripZona) &&
          (listaTipos.indexOf(pr.tipo) < 0)) {
        listaTipos.add(pr.tipo);
      }
    });
    return listaTipos;
  }

  Future<List<OcioCultura>> cargarImgOcioCultura(
      String descripZona, String tipo) async {
    if (listaInfo.length == 0) {
      await cargarPuntos();
    }
    _imgOcioCultura = [];
    listaInfo.forEach((pr) {
      if ((pr.descripZona == descripZona) && (pr.tipo == tipo)) {
        _imgOcioCultura.add(pr);
      }
    });
    return _imgOcioCultura;
  }
}

final ocioycultura = new OcioProvider();
