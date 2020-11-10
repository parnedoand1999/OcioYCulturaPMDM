import 'package:flutter/material.dart';
import 'package:ocio_y_cultura/models/ocioycultura_model.dart';
import 'package:ocio_y_cultura/screens/mapa_screen.dart';

class SliderWidget extends StatelessWidget {
  final List<OcioCultura> lista;

  SliderWidget({@required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _slider(context),
    );
  }

  Widget _slider(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.7),
        children: _elementos(context),
      ),
    );
  }

  List<Widget> _elementos(BuildContext context) {
    final List<Widget> lst = [];
    lista.forEach((p) {
      // final c = Container(
      //   margin: EdgeInsets.only(right: 20.0),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(10.0),
      //     child: FadeInImage(
      //       placeholder: NetworkImage(p.getImgUrl()),
      //       image: NetworkImage(p.getImgUrl()),
      //       fit: BoxFit.cover,
      //       height: 120.0,
      final c = GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MapaScreen(ocio: p)));
        },
        child: Container(
          margin: EdgeInsets.only(right: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage(
              placeholder: NetworkImage(p.getImgUrl()),
              image: NetworkImage(p.getImgUrl()),
              fit: BoxFit.cover,
              height: 120.0,
            ),
          ),
        ),
      );
      lst.add(c);
    });
    return lst;
  }
}
