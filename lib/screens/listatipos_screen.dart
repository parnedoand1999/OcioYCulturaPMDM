import 'package:flutter/material.dart';

import '../providers/ocio_providers.dart';
class ListaTiposScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipos "),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

 return FutureBuilder(
      future: ocioycultura.cargarTipos("La Ribera"),
      initialData: [],
      builder: (context, snapshot) {
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

  List<Widget> _listaElementos(List<String> data) {

    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {},
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;

  }
}