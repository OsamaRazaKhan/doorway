import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/res/components/myBookings_components/custom_liveOrdersContainer.dart';
import 'package:doorway/res/components/myBookings_components/custom_ordersHistoryContainer.dart';
import 'package:doorway/view_model/myBooking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/SizeConfig.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyBookingsScreenState createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final myBookingsViewModel =
        Provider.of<MyBookingsViewModel>(context, listen: false);
    myBookingsViewModel.initializeMyBookingsData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      myBookingsViewModel.callOrderListings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: shopAppbarBack("My Bookings", context, isBackEnable: true),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: SizeConfig.height10,
                ),
                Container(
                  child: const TabBar(
                    tabs: [
                      Tab(
                        text: "Live",
                      ),
                      Tab(
                        text: "History",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeConfig.width30),
                    child: const TabBarView(
                      children: [
                        CustomLiveOrdersContainer(),
                        CustomOrdersHistoryContainer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
