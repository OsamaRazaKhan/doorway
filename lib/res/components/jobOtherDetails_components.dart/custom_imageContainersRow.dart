import 'package:doorway/res/components/jobOtherDetails_components.dart/customImageContainer.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomImageContainersRow extends StatefulWidget {
  const CustomImageContainersRow({super.key});

  @override
  State<CustomImageContainersRow> createState() =>
      _CustomImageContainersRowState();
}

class _CustomImageContainersRowState extends State<CustomImageContainersRow> {
  @override
  Widget build(BuildContext context) {
    final subServicesViewModel = Provider.of<SubServicesViewModel>(
      context,
    );
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.height10, horizontal: SizeConfig.width20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomImageContainer(
              hasImage: subServicesViewModel.images.length == 5,
              containerIndex: 4,
              containerHeight: SizeConfig.height170,
              containerWidth: SizeConfig.width160,
            ),
            SizedBox(
              width: SizeConfig.width10,
            ),
            Column(
              children: [
                CustomImageContainer(
                  hasImage: subServicesViewModel.images.length >= 4,
                  containerIndex: 3,
                  containerHeight: SizeConfig.height80,
                  containerWidth: SizeConfig.width80,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomImageContainer(
                  hasImage: subServicesViewModel.images.length >= 3,
                  containerIndex: 2,
                  containerHeight: SizeConfig.height80,
                  containerWidth: SizeConfig.width80,
                ),
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              children: [
                CustomImageContainer(
                  hasImage: subServicesViewModel.images.length >= 2,
                  containerIndex: 1,
                  containerHeight: SizeConfig.height80,
                  containerWidth: SizeConfig.width80,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomImageContainer(
                  hasImage: subServicesViewModel.images.isNotEmpty,
                  containerIndex: 0,
                  containerHeight: SizeConfig.height80,
                  containerWidth: SizeConfig.width80,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
