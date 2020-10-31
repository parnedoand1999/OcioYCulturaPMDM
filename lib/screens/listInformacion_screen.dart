import 'package:flutter/material.dart';
import 'package:ocio_y_cultura/models/ocioycultura_model.dart';
import 'package:ocio_y_cultura/providers/ocio_providers.dart';

class ListInformacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Informacion Completa"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: ocioycultura.cargarPuntos(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(List<OcioCultura> data) {
    final List<Widget> lista = [];
    data.forEach((pr) {
      final informacion = new ListBody(
        children: [
          Text(
            "Código Recurso: " + pr.codrecurso,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Url Nombre Cast: " + pr.urlNombreCast,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Nombre: " + pr.nombre,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Url Nombre buscador: " + pr.urlNombreBuscador,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Url ID Recurso Categoria: " + pr.urlIdRecursoCategoria,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Código de categoria: " + pr.codCategoria,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "ID Recurso categoria: " + pr.idRecursoCategoria,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "ID categoria:  " + pr.idcategoria,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Nombre de la localidad: " + pr.nombreLocalidad,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Descripcion de la zona: " + pr.descripZona,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Ruta: " + pr.path,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Imagen fichero: " + pr.imgFichero,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Tipo: " + pr.tipo,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Distancia: " + pr.distancia,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Coordenadas X del mapa: " + pr.georrX,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Coordenadas Y del mapa:  " + pr.georrY,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Diploma comnpromiso: " + pr.diplomacompromiso,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      );

      lista.add(informacion);
      lista.add(Divider());
      lista.add(Divider());
      lista.add(Divider());
      lista.add(Divider());
      lista.add(Divider());
    });
    return lista;
  }
}
