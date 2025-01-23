import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/global_components/custom_loadMore.dart';
import 'package:doorway/res/components/global_components/custom_showLoading.dart';
import 'package:doorway/res/components/myBookings_components/custom_orderSingleContainer.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/myBooking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomOrdersHistoryContainer extends StatefulWidget {
  const CustomOrdersHistoryContainer({super.key});

  @override
  State<CustomOrdersHistoryContainer> createState() =>
      _CustomOrdersHistoryContainerState();
}

class _CustomOrdersHistoryContainerState
    extends State<CustomOrdersHistoryContainer> {
  @override
  Widget build(BuildContext context) {
    final myBookingsViewModel = Provider.of<MyBookingsViewModel>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: myBookingsViewModel.historyOrderLoading
                ? SizedBox(
                    height: SizeConfig.height500,
                    child: const CustomShowLoading(
                        title: "Loading orders history..."))
                : myBookingsViewModel.historyOrderList.isEmpty
                    ? SizedBox(
                        height: SizeConfig.height500,
                        child: const Center(
                          child: CustomGoogleFontText(
                            text: 'No record found',
                            color: Colors.black,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                myBookingsViewModel.historyOrderList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.width10,
                                  right: SizeConfig.width10,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Map<String, dynamic> arguments = {
                                      'orderId': myBookingsViewModel
                                          .historyOrderList[index].id,
                                    };
                                    myBookingsViewModel
                                        .moveToOrderDetailsScreen(
                                            context, arguments);
                                  },
                                  child: CustomOrderSingleContainer(
                                    index: index,
                                    ordersList:
                                        myBookingsViewModel.historyOrderList,
                                  ),
                                ),
                              );
                            }),
                      ),
          ),
          SizedBox(
            height: SizeConfig.height40,
          ),
          GestureDetector(
            onTap: () {
              myBookingsViewModel.callHistoryOrderListings();
            },
            child: myBookingsViewModel.historyOrderList.isNotEmpty
                ? const CustomLoadmore(
                    forLive: false,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
