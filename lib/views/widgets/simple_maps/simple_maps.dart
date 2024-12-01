import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapsWidget extends StatefulWidget {
  const SimpleMapsWidget({super.key});

  @override
  State<SimpleMapsWidget> createState() => _SimpleMapsWidgetState();
}

final initalLocation=LatLng(31.32, 30.35);

Set<Marker> markers={};

Set<MyLocations> mylocations={};

late Uint8List? markerIcon ;

class _SimpleMapsWidgetState extends State<SimpleMapsWidget> {

  /*@override
  Future<void> initState() async {
    super.initState();
    //markerIcon = await getBytesFromAsset('assets/images/marker.png');
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple googlemaps"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: initalLocation,
            zoom: 14
        ),
        mapType: MapType.satellite,
        onTap: (argument) {
          //markers.add(Marker(markerId: MarkerId("myLocation"),position: argument));
          markers.add(Marker(
              markerId: MarkerId("${argument.latitude}${argument.longitude}")
              , position: argument,
              icon: BitmapDescriptor.defaultMarkerWithHue(90),
              //icon: markerIcon!=null?BitmapDescriptor.fromBytes(markerIcon!):BitmapDescriptor.defaultMarkerWithHue(90),
              infoWindow: InfoWindow(
                  title: "Location details",
                  snippet: "${argument.latitude}-${argument.longitude}"
              )));
          setState(() {

          });
        },
        onLongPress: (argument) {
          mylocations.add(
              MyLocations(late: argument.latitude, long: argument.longitude));
        },
      ),
    );
  }

  Future<Uint8List?> getBytesFromAsset(String path) async {
    double pixelRatio = MediaQuery
        .of(context)
        .devicePixelRatio;
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetWidth: pixelRatio.round() * 30
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer
        .asUint8List();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }


    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);

    return await Geolocator.getCurrentPosition();
  }
}

class MyLocations{
  final double late,long;

  MyLocations({required this.late,required this.long});

}
