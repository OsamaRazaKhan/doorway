import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/res/components/selectLocation_components/custom_firstPortionSetLocation.dart';
import 'package:doorway/res/components/selectLocation_components/custom_secondPortionSetLocation.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  void initState() {
    super.initState();
    final locationViewModel =
        Provider.of<LocationViewModel>(context, listen: false);
    locationViewModel.initializeLocation();
  }

  @override
  Widget build(BuildContext context) {
    final locationViewModel = Provider.of<LocationViewModel>(
      context,
    );
    return Scaffold(
      appBar: shopAppbarBack('Locations', context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///// First Portion
            const CustomFirstPortionSetLocation(),
            SizedBox(height: SizeConfig.height30),
            ///// Second Portion
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.width8,
                  right: SizeConfig.width8,
                  top: SizeConfig.height8,
                  bottom: SizeConfig.height50),
              child: const CustomSecondportionsetlocation(),
            ),
          ],
        ),
      ),
      bottomSheet: CustomElevatedButton(
          loading: locationViewModel.isWorking,
          title: 'Confirm Location',
          onPress: locationViewModel.isWorking == false
              ? () {
                  Map<String, dynamic> data = {
                    'address': locationViewModel.addressController.text,
                    'lat': locationViewModel.latitude,
                    'lng': locationViewModel.longititude,
                    'nick_name': locationViewModel.nickNameController.text,
                    'flat': locationViewModel.flatNumberController.text,
                    'building': locationViewModel.buildingNameController.text,
                  };
                  locationViewModel.addLoction(data);
                }
              : null),
    );
  }
}
