// To parse this JSON data, do
//
//     final ocioCultura = ocioCulturaFromJson(jsonString);

import 'dart:convert';

OcioCultura ocioCulturaFromJson(String str) =>
    OcioCultura.fromJson(json.decode(str));

String ocioCulturaToJson(OcioCultura data) => json.encode(data.toJson());

class OcioCultura {
  final _url = "https://www.turismo.navarra.es/imgs/rrtt/";
  final _web = "https://www.turismo.navarra.es/esp/organice-viaje/recurso/recurso.aspx?o=";
  getImgUrl() {
    return _url + this.path + this.imgFichero;
  }
    getWebUrl() {
    return _web + this.codrecurso;
  }

  OcioCultura({
    this.codrecurso,
    this.urlNombreCast,
    this.nombre,
    this.urlNombreBuscador,
    this.urlIdRecursoCategoria,
    this.codCategoria,
    this.idRecursoCategoria,
    this.idcategoria,
    this.nombreLocalidad,
    this.descripZona,
    this.path,
    this.imgFichero,
    this.tipo,
    this.distancia,
    this.georrX,
    this.georrY,
    this.diplomacompromiso,
  });

  String codrecurso;
  String urlNombreCast;
  String nombre;
  String urlNombreBuscador;
  String urlIdRecursoCategoria;
  String codCategoria;
  String idRecursoCategoria;
  String idcategoria;
  String nombreLocalidad;
  String descripZona;
  String path;
  String imgFichero;
  String tipo;
  String distancia;
  String georrX;
  String georrY;
  String diplomacompromiso;

  factory OcioCultura.fromJson(Map<String, dynamic> json) => OcioCultura(
        codrecurso: json["Codrecurso"],
        urlNombreCast: json["URLNombreCast"],
        nombre: json["Nombre"],
        urlNombreBuscador: json["URLNombreBuscador"],
        urlIdRecursoCategoria: json["URLIdRecursoCategoria"],
        codCategoria: json["CodCategoria"],
        idRecursoCategoria: json["IdRecursoCategoria"],
        idcategoria: json["IDCATEGORIA"],
        nombreLocalidad: json["NombreLocalidad"],
        descripZona: json["DescripZona"],
        path: json["Path"],
        imgFichero: json["ImgFichero"],
        tipo: json["Tipo"],
        distancia: json["Distancia"],
        georrX: json["GEORR_X"],
        georrY: json["GEORR_Y"],
        diplomacompromiso: json["DIPLOMACOMPROMISO"],
      );

  Map<String, dynamic> toJson() => {
        "Codrecurso": codrecurso,
        "URLNombreCast": urlNombreCast,
        "Nombre": nombre,
        "URLNombreBuscador": urlNombreBuscador,
        "URLIdRecursoCategoria": urlIdRecursoCategoria,
        "CodCategoria": codCategoria,
        "IdRecursoCategoria": idRecursoCategoria,
        "IDCATEGORIA": idcategoria,
        "NombreLocalidad": nombreLocalidad,
        "DescripZona": descripZona,
        "Path": path,
        "ImgFichero": imgFichero,
        "Tipo": tipo,
        "Distancia": distancia,
        "GEORR_X": georrX,
        "GEORR_Y": georrY,
        "DIPLOMACOMPROMISO": diplomacompromiso,
      };
}
