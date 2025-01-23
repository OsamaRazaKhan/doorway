import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatlongToaddress extends StatefulWidget {
  const ConvertLatlongToaddress({super.key});

  @override
  State<ConvertLatlongToaddress> createState() =>
      _ConvertLatlongToaddressState();
}

class _ConvertLatlongToaddressState extends State<ConvertLatlongToaddress> {
  String stAddress = '';
  String stAdd = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('google map'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(stAddress),
          Text(stAdd),
          GestureDetector(
            onTap: () async {
              List<Location> locations =
                  await locationFromAddress("Gronausestraat 710, Enschede");
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(33.778045, 73.084488);
              setState(() {
                stAddress =
                    "${locations.last.latitude.toString()} ${locations.last.longitude.toString()} ";
                stAdd =
                    "${placemarks.reversed.last.country.toString()} ${placemarks.reversed.last.locality.toString()} ${placemarks.reversed.last.street.toString()}";
              });
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: const BoxDecoration(color: Colors.green),
                child: const Center(
                  child: Text('Convert'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
