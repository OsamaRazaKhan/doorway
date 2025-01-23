import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/global_components/custom_showLoading.dart';
import 'package:doorway/res/components/global_components/custom_somethingWrong.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/orderDetails_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomOrderDetailsContainer extends StatefulWidget {
  const CustomOrderDetailsContainer({super.key});

  @override
  State<CustomOrderDetailsContainer> createState() =>
      _CustomOrderDetailsContainerState();
}

class _CustomOrderDetailsContainerState
    extends State<CustomOrderDetailsContainer> {
  @override
  Widget build(BuildContext context) {
    final orderDetailsViewModel = Provider.of<OrderdetailsViewModel>(context);
    return Container(
        height: SizeConfig.height650,
        padding: EdgeInsets.only(
          left: SizeConfig.width20,
          right: SizeConfig.width20,
          top: SizeConfig.height20,
          bottom: SizeConfig.height20,
        ),
        child: orderDetailsViewModel.singleOrderDetails != null
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomGoogleFontText(
                          text:
                              'Order No: ${orderDetailsViewModel.singleOrderDetails!.orderNo}',
                        )
                      ],
                    ),
                    SizedBox(height: SizeConfig.height50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomGoogleFontText(text: 'Order status:'),
                        CustomGoogleFontText(
                            text:
                                '${orderDetailsViewModel.singleOrderDetails!.status}')
                      ],
                    ),
                    SizedBox(height: SizeConfig.height50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomGoogleFontText(text: 'Order category:'),
                        CustomGoogleFontText(
                            text:
                                '${orderDetailsViewModel.singleOrderDetails!.catName}')
                      ],
                    ),
                    SizedBox(height: SizeConfig.height50),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomGoogleFontText(text: 'Order service:'),
                        CustomGoogleFontText(text: 'Service Abc')
                      ],
                    ),
                    SizedBox(height: SizeConfig.height50),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomGoogleFontText(text: 'Order sub service:'),
                        CustomGoogleFontText(text: 'Sub-service Abc')
                      ],
                    ),
                    SizedBox(height: SizeConfig.height50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomGoogleFontText(text: 'Tax:'),
                        CustomGoogleFontText(
                            text:
                                '${orderDetailsViewModel.singleOrderDetails!.vatIncluded}%')
                      ],
                    ),
                    SizedBox(height: SizeConfig.height50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomGoogleFontText(text: 'Tax value:'),
                        CustomGoogleFontText(
                            text:
                                '${orderDetailsViewModel.singleOrderDetails!.vatValue}')
                      ],
                    ),
                    SizedBox(height: SizeConfig.height50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomGoogleFontText(text: 'Total price:'),
                        CustomGoogleFontText(
                            text:
                                '${orderDetailsViewModel.singleOrderDetails!.total}')
                      ],
                    ),
                  ],
                ),
              )
            : orderDetailsViewModel.Loading == true
                ? const Center(
                    child: CustomShowLoading(title: 'Please wait'),
                  )
                : const CustomSomethingWrong());
  }
}
