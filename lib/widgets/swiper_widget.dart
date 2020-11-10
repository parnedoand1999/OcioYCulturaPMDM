import 'package:flutter/material.dart';
import 'package:ocio_y_cultura/models/ocioycultura_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ocio_y_cultura/screens/webview_screen.dart';

class SwiperWidget extends StatelessWidget {
  final List<OcioCultura> lista;

  SwiperWidget({@required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _swiper(context),
    );
  }

  Widget _swiper(context) {
    final screenSize = MediaQuery.of(context).size;
    return Swiper(
      itemWidth: screenSize.width * 0.5,
      itemHeight: screenSize.height * 0.4,
      layout: SwiperLayout.STACK,
      itemBuilder: (BuildContext context, int index) {
        // return ClipRRect(
          // borderRadius: BorderRadius.circular(20.0),
          // child: Image.network(
          //   "http://via.placeholder.com/350x150",
          //   fit: BoxFit.fill,
          // ),
          // child: FadeInImage(
          //   placeholder: NetworkImage(lista[index].getImgUrl()),
          //   image: NetworkImage(lista[index].getImgUrl()),
          //   fit: BoxFit.cover,
           return GestureDetector(
          onTap: () {
            //print("url: ${lista[index].getWebUrl()}");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WebViewScreen(ocio: lista[index])));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            // child: Image.network(
            //   "http://via.placeholder.com/350x150",
            //   fit: BoxFit.fill,
            // ),
            child: FadeInImage(
              placeholder: NetworkImage(lista[index].getImgUrl()),
              image: NetworkImage(lista[index].getImgUrl()),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      itemCount: lista.length,
      // pagination: new SwiperPagination(),
      // control: new SwiperControl(),
    ); // Swiper
  }
}
