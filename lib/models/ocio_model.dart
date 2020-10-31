import 'package:ocio_y_cultura/models/ocioycultura_model.dart';

class Ocio {
  List<OcioCultura> lista = new List();
  Ocio.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((json) {
      final pr = OcioCultura.fromJson(json);
      lista.add(pr);
    });
  }
}
