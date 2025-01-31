import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/addAddress_components/custom_savedAddresses.dart';
import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HandyManSavedAddresses extends StatefulWidget {
  const HandyManSavedAddresses({
    super.key,
  });

  @override
  _SavedAddressesState createState() => _SavedAddressesState();
}

class _SavedAddressesState extends State<HandyManSavedAddresses> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    final locationViewModel =
        Provider.of<LocationViewModel>(context, listen: false);

    locationViewModel.initializeLocationsData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dynamic data = {};
      locationViewModel.getLocations(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationViewModel = Provider.of<LocationViewModel>(
      context,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: shopAppbarBack('Locations', context),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.height20),
          Align(
            alignment: Alignment.center,
            child: locationViewModel.wannaPlaceOrder!
                ? CustomGoogleFontText(
                    text: 'Choose from saved addresses',
                    size: SizeConfig.width15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )
                : const SizedBox.shrink(),
          ),
          const CustomSavedAddresses(),
          SizedBox(height: SizeConfig.height10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          LocationViewModel.moveToSetLocation(context);
        },
      ),
    );
  }
}
