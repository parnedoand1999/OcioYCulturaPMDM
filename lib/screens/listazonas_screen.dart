import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ocio_y_cultura/providers/ocio_providers.dart';
import 'package:get/get.dart';
import 'package:ocio_y_cultura/screens/listatipos_screen.dart';
import 'package:ocio_y_cultura/widgets/menu_widget.dart';

class ListaZonasScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    box.write('descripZona', null);
    box.write('tipo', null);
    return Scaffold(
      appBar: AppBar(
        title: Text("Zonas "),
      ),
      drawer: MenuWidget(),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: ocioycultura.cargarZonas(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(BuildContext context, List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          box.write('descripZona', element);
          args['descripZona'] = element;
          // Navigator.pushNamed(context, 'localidades', arguments: args);
          Get.offAll(ListaTiposScreen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
