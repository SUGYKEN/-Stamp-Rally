import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UseMapScreen extends StatefulWidget {
  @override
  _UseMapScreenState createState() => _UseMapScreenState();
}

class _UseMapScreenState extends State<UseMapScreen> {
  @override
  Widget build(BuildContext context) {
    return MapView();
  }
}

class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => MapSampleState();
}

class MapSampleState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = Set();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  double _fontSize = 15.0;

  TextEditingController _textLatitudeController = TextEditingController();
  TextEditingController _textLongitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      Wrap()
        appBar: AppBar(
          title: Text("スタンプラリー"),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap:  () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      Text(
                        "緯度を入力",
                        style: TextStyle(fontSize: _fontSize),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: _fontSize),
                        controller: _textLatitudeController,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "経度を入力",
                        style: TextStyle(fontSize: _fontSize),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: _fontSize),
                        controller: _textLongitudeController,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 500,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: markers,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
          verticalDirection: VerticalDirection.up,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: _addMark,
              label: Text('Add Marker !!'),
              icon: Icon(Icons.directions_bus_outlined),
            ),
            SizedBox(height: 10,),
            FloatingActionButton.extended(
              onPressed: _moveMap,
              label: Text('Move Map !!'),
              icon: Icon(Icons.directions_boat),
            ),
          ],
        ));
  }

  Future<void> _moveMap() async {
    final GoogleMapController controller = await _controller.future;

    double _latitude = 0.0;
    double _longitude = 0.0;

    if (_textLatitudeController.text == "" ||
        _textLongitudeController.text == "") {
      Fluttertoast.showToast(
          msg: "数字入れてくださいな",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black38,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    _latitude = double.parse(_textLatitudeController.text.toString());
    _longitude = double.parse(_textLongitudeController.text.toString());

    LatLng latLng = LatLng(_latitude, _longitude);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 15);
    print(_latitude);
    print(_longitude);
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<void> _addMark() async {
    final GoogleMapController controller = await _controller.future;

    double _latitude = 0.0;
    double _longitude = 0.0;

    if (_textLatitudeController.text == "" ||
        _textLongitudeController.text == "") {
      Fluttertoast.showToast(
          msg: "数字入れてくださいな",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black38,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    _latitude = double.parse(_textLatitudeController.text.toString());
    _longitude = double.parse(_textLongitudeController.text.toString());

    LatLng latLng = LatLng(_latitude, _longitude);
    MarkerId markerId = MarkerId("MARK2");
    Marker marker = Marker(markerId: markerId, position: latLng);
    markers.add(marker);
    setState(() {});
  }
}
