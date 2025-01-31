import 'package:doorway/res/components/jobSummary_components.dart/custom_summaryTopItem.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/home_view_model.dart';
import 'package:doorway/view_model/order_view_model.dart';
import 'package:doorway/view_model/services_view_model.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomGridForJobSummary extends StatefulWidget {
  const CustomGridForJobSummary({super.key});

  @override
  State<CustomGridForJobSummary> createState() =>
      _CustomGridForJobSummaryState();
}

class _CustomGridForJobSummaryState extends State<CustomGridForJobSummary> {
  @override
  Widget build(BuildContext context) {
    final servicesViewModel = Provider.of<ServicesViewModel>(
      context,
    );
    final homeViewModel = Provider.of<HomeViewModel>(
      context,
    );
    final subServicesViewModel = Provider.of<SubServicesViewModel>(
      context,
    );
    final orderViewModel = Provider.of<OrderViewModel>(
      context,
    );
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.0,
            mainAxisSpacing: 10,
            crossAxisSpacing: 15,
            mainAxisExtent: 105),
        itemBuilder: (BuildContext context, index) {
          if (index == 0) {
            return Container(
              margin: EdgeInsets.only(left: SizeConfig.width20),
              child: CustomSummaryTopItem(
                  title: "Vendor", text: "Color Services", onTap: () {}),
            );
          } else if (index == 1) {
            return Container(
              margin: EdgeInsets.only(right: SizeConfig.width20),
              child: CustomSummaryTopItem(
                  title: "Category",
                  text: homeViewModel.selectedCategory!.title!,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            );
          } else if (index == 2) {
            return Container(
              margin: EdgeInsets.only(left: SizeConfig.width20),
              child: CustomSummaryTopItem(
                  title: "Location",
                  text: "change",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            );
          } else if (index == 3) {
            return Container(
              margin: EdgeInsets.only(right: SizeConfig.width20),
              child: CustomSummaryTopItem(
                  title: "Service",
                  text: servicesViewModel.selectedService!.title!,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            );
          } else if (index == 4) {
            return Container(
              margin: EdgeInsets.only(left: SizeConfig.width20),
              child: CustomSummaryTopItem(
                  title: "Sub-Service",
                  text: subServicesViewModel.subServicesList.isNotEmpty
                      ? subServicesViewModel
                          .subServicesList[subServicesViewModel.selectedIndex]
                          .title!
                      : "No Sub-Service",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(right: SizeConfig.width20),
              child: CustomSummaryTopItem(
                  title: "Ladder?",
                  text: subServicesViewModel.SelectedLadderOption,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            );
          }
        });
  }
}
