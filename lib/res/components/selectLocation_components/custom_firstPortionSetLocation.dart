import 'package:doorway/res/components/global_components/custom_showLoading.dart';
import 'package:doorway/res/components/global_components/custom_somethingWrong.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CustomFirstPortionSetLocation extends StatefulWidget {
  const CustomFirstPortionSetLocation({super.key});

  @override
  State<CustomFirstPortionSetLocation> createState() =>
      _CustomFirstPortionSetLocationState();
}

class _CustomFirstPortionSetLocationState
    extends State<CustomFirstPortionSetLocation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final locationViewModel =
        Provider.of<LocationViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locationViewModel.loadMap();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationViewModel = Provider.of<LocationViewModel>(context);
    return SizedBox(
      height: SizeConfig.height350,
      child: Stack(
        children: [
          locationViewModel.mapLoading
              ? const CustomShowLoading(title: "Loading map...")
              : locationViewModel.cameraPostion == null
                  ? const CustomSomethingWrong()
                  : GoogleMap(
                      initialCameraPosition: locationViewModel.cameraPostion!,
                      markers: Set<Marker>.of(locationViewModel.marker),
                      onMapCreated: (GoogleMapController controller) {
                        locationViewModel.mainController.complete(controller);
                      },
                    ),
          // ListView.builder(
          //     itemCount: locationViewModel.placesList.length,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () async {
          //           List<Location> locations = await locationFromAddress(
          //               locationViewModel.placesList[index]['description']);
          //         },
          //         child: ListTile(
          //           title: Text(
          //               locationViewModel.placesList[index]['description']),
          //         ),
          //       );
          //     }),
          locationViewModel.cameraPostion != null
              ? Positioned(
                  top: SizeConfig.height20,
                  left: SizeConfig.width16,
                  right: SizeConfig.width16,
                  child: TextField(
                    controller: locationViewModel.controller,
                    decoration: InputDecoration(
                      hintText: 'Search Location',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.width16,
                        vertical: SizeConfig.height12,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
