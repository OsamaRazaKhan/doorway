import 'package:doorway/res/components/selectLocation_components/custom_addressField.dart';
import 'package:doorway/res/components/selectLocation_components/custom_changeContainerLocation.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSecondportionsetlocation extends StatelessWidget {
  const CustomSecondportionsetlocation({super.key});
  @override
  Widget build(BuildContext context) {
    final locationViewModel = Provider.of<LocationViewModel>(
      context,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Container(
                  margin: EdgeInsets.only(top: SizeConfig.height7),
                  child: CustomAddressField(
                    controller: locationViewModel.addressController,
                    title: 'Cross check before confirm location',
                    hintText: 'your address here',
                    divider: false,
                  )),
            ),
            const CustomChangeContainerLocation(),
          ],
        ),
        const Divider(
          color: Colors.black,
          thickness: 2,
        ),
        SizedBox(
          height: SizeConfig.height30,
        ),
        Row(
          children: [
            Flexible(
              child: CustomAddressField(
                controller: locationViewModel.buildingNameController,
                title: 'Building name',
                exampleTitle: 'e.g alnoor block',
              ),
            ),
            SizedBox(
              width: SizeConfig.width10,
            ),
            Flexible(
                child: CustomAddressField(
              controller: locationViewModel.flatNumberController,
              title: 'Flat no',
              exampleTitle: 'eg. 2489',
            )),
          ],
        ),
        SizedBox(
          height: SizeConfig.height30,
        ),
        CustomAddressField(
          controller: locationViewModel.nickNameController,
          title: 'Nickname',
          hintText: '',
        )
      ],
    );
  }
}
