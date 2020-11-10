import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:ocio_y_cultura/models/ocioycultura_model.dart';
import 'package:latlong/latlong.dart';
import 'package:ocio_y_cultura/screens/img_screen.dart';
import 'package:ocio_y_cultura/screens/webview_screen.dart';
import 'package:utm/utm.dart';

class MapaScreen extends StatefulWidget {
  final OcioCultura ocio;

  MapaScreen({@required this.ocio});

  @override
  _MapaScreenState createState() => _MapaScreenState(ocio: ocio);
}

class _MapaScreenState extends State<MapaScreen> {
  final OcioCultura ocio;
  final map = new MapController();
  var latlon;

  _MapaScreenState({@required this.ocio}) {
    latlon = UTM.fromUtm(
      easting: double.parse(ocio.georrX),
      northing: double.parse(ocio.georrY),
      zoneNumber: 30,
      zoneLetter: "N",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          _header(),
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: _flutterMap(),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
          )
        ],
      ),
    );
  }

  Widget _header() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WebViewScreen(ocio: ocio)));
      },
      child: Container(
        child: Column(
          children: [
            Text(ocio.nombre,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: ocio.codrecurso,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FadeInImage(
                      placeholder: NetworkImage(ocio.getImgUrl()),
                      image: NetworkImage(ocio.getImgUrl()),
                      fit: BoxFit.cover,
                      height: 100.0,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(ocio.nombreLocalidad),
                    Text("Información web"),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _flutterMap() {
    return new FlutterMap(
      mapController: map,
      options: new MapOptions(
        center: new LatLng(latlon.lat, latlon.lon),
        zoom: 18.0,
      ),
      layers: [
        _mapa(),
        _markers(),
      ],
    );
  }

  _mapa() {
    return new TileLayerOptions(
      urlTemplate: "https://api.tiles.mapbox.com/v4/"
          "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
      additionalOptions: {
        'accessToken':
            'pk.eyJ1IjoicGVpb2FybmVkbzE5OTkiLCJhIjoiY2toY2VpdTg0MDFsYjJyb2xjdTYxZ2dsMCJ9._7l4xmcaOH4ksiALiS3JpQ',
        'id': 'mapbox.satellite',
      },
    );
  }

  _markers() {
    return new MarkerLayerOptions(
      markers: [
        new Marker(
          width: 50.0,
          height: 50.0,
          point: new LatLng(latlon.lat, latlon.lon),
          builder: (ctx) => new Container(
            child: Icon(Icons.place, color: Colors.red[700]),
          ),
        ),
      ],
    );
  }
}
