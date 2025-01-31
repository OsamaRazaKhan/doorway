import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/addAddress_components/custom_addressContainer.dart';
import 'package:doorway/res/components/global_components/custom_showLoading.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSavedAddresses extends StatelessWidget {
  const CustomSavedAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    final locationViewModel = Provider.of<LocationViewModel>(
      context,
    );
    return locationViewModel.locationsLoading
        ? const Expanded(
            child: const CustomShowLoading(title: "Loading locations..."))
        : locationViewModel.locationsList.isEmpty
            ? const Expanded(
                child: const Center(
                  child: CustomGoogleFontText(
                    text: 'No record found',
                    color: Colors.black,
                  ),
                ),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: locationViewModel.locationsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (locationViewModel.wannaPlaceOrder == true) {
                          locationViewModel.selectedLocation =
                              locationViewModel.locationsList[index];
                          LocationViewModel.moveToHandyManView(context);
                        }
                      },
                      child: CustomAddresscontainer(
                          flat: locationViewModel.locationsList[index].flat!,
                          building:
                              locationViewModel.locationsList[index].building!,
                          address:
                              locationViewModel.locationsList[index].address!),
                    );
                  },
                ),
              );
  }
}
