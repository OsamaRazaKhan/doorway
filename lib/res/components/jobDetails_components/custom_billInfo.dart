import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/view_model/services_view_model.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doorway/utils/SizeConfig.dart';

class CustomBillInfo extends StatefulWidget {
  final String currency;

  const CustomBillInfo({Key? key, required this.currency}) : super(key: key);

  @override
  _CustomBillInfoState createState() => _CustomBillInfoState();
}

class _CustomBillInfoState extends State<CustomBillInfo> {
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    final subServiceViewModel =
        Provider.of<SubServicesViewModel>(context, listen: false);
    final servicesViewModel =
        Provider.of<ServicesViewModel>(context, listen: false);

    totalPrice = 0;
    for (var element in subServiceViewModel.subServicesList) {
      if (element.isSelected) {
        if (element.price != '') {
          totalPrice += int.parse(element.price!);
        }
      }
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          SizedBox(
            height: SizeConfig.height5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomGoogleFontText(
                text: 'Total (All inclusive)',
                size: SizeConfig.width16,
                color: Colors.black,
              ),
              CustomGoogleFontText(
                text: servicesViewModel.selectedService!.hasSubService == '1'
                    ? 'USD ${widget.currency}'
                    : 'USD ${servicesViewModel.selectedService!.price.toString()}',
                size: SizeConfig.width16,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.height10,
          ),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.black,
                size: SizeConfig.width18,
              ),
              SizedBox(
                width: SizeConfig.width10,
              ),
              CustomGoogleFontText(
                text: 'Duties may apply',
                size: SizeConfig.width10,
                color: Colors.black,
              )
            ],
          ),
        ],
      ),
    );
  }
}
