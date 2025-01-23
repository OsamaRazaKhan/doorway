import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 16.4746,
  );

  List<Marker> _marker = [];

  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6844, 73.0479),
        infoWindow: InfoWindow(title: 'My Current Location')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(33.778045, 73.084488),
        infoWindow: InfoWindow(title: 'e-11 sector')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(33.738045, 73.084488),
        infoWindow: InfoWindow(title: 'e2 sector')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(20.5937, 78.9629),
        infoWindow: InfoWindow(title: 'India')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          initialCameraPosition: _kGooglePlex,
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.location_disabled),
            onPressed: () async {
              GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  const CameraPosition(
                      target: LatLng(20.5937, 78.9629), zoom: 14)));
              setState(() {});
            }),
      ),
    );
  }
}
