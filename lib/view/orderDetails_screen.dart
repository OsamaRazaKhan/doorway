import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/res/components/orderDetails_components/custom_orderDetailsContainer.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/orderDetails_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailScreenPage extends StatefulWidget {
  final int orderId;
  const OrderDetailScreenPage({super.key, required this.orderId});

  @override
  State<OrderDetailScreenPage> createState() => _OrderDetailScreenPageState();
}

class _OrderDetailScreenPageState extends State<OrderDetailScreenPage> {
  @override
  void initState() {
    super.initState();
    final orderDetailsViewModel =
        Provider.of<OrderdetailsViewModel>(context, listen: false);
    Map<String, dynamic> data = {
      'order_id': widget.orderId.toString(),
    };
    orderDetailsViewModel.initializeMyBookingsData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orderDetailsViewModel.getSingleOrderDetails(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderDetailsViewModel = Provider.of<OrderdetailsViewModel>(context);
    return Scaffold(
        appBar: shopAppbarBack('Order Details', context),
        body: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.width30,
            right: SizeConfig.width30,
            top: SizeConfig.height20,
            bottom: SizeConfig.height120,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                // Shadow below the container
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: const Offset(5, 5),
                  blurRadius: 10,
                  spreadRadius: 10,
                ),
                // Light shadow above the container for the 3D effect
              ],
            ),
            child: const CustomOrderDetailsContainer(),
          ),
        ),
        bottomSheet: orderDetailsViewModel.singleOrderDetails == null
            ? const SizedBox.shrink()
            : orderDetailsViewModel.singleOrderDetails!.status ==
                    'Service Delivered'
                ? const SizedBox.shrink()
                : orderDetailsViewModel.singleOrderDetails!.status !=
                        'Team Reached'
                    ? CustomElevatedButton(
                        title: 'Cancel Order', onPress: () {})
                    : CustomElevatedButton(title: 'Pay Now', onPress: () {}));
  }
}
