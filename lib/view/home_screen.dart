import 'dart:io';

import 'package:doorway/global.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/ExitDialog.dart';
import 'package:doorway/res/components/Home_components/custom_adCard.dart';
import 'package:doorway/res/components/custom_bookNowCards.dart';
import 'package:doorway/res/components/custom_bottomBar.dart';
import 'package:doorway/res/components/custom_searchField.dart';
import 'package:doorway/res/components/custom_serviceCardGrid.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    Map<String, dynamic> data = {
      'cat_id': '5',
    };
    homeViewModel.GetCategories(data);
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return WillPopScope(
        onWillPop: () async {
          bool result = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ExitDialog();
            },
          );
          if (result == true) {
            exit(0);
          } else {
            return false;
          }
        },
        child: Scaffold(
          body: ListView(
              shrinkWrap: true,
              addAutomaticKeepAlives: true,
              children: [
                SizedBox(
                  height: SizeConfig.height10,
                ),
                Row(
                  children: [
                    Expanded(child: searchField()),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: SizeConfig.width30,
                          height: SizeConfig.height35,
                          margin: const EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: Center(
                            child: Icon(Icons.notifications_active,
                                size: SizeConfig.height14 < SizeConfig.width17
                                    ? SizeConfig.height14
                                    : SizeConfig.width17,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
                bookNowCards(context),
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                  child: CustomGoogleFontText(
                    text: 'What services would you like to book, Osama?',
                    size: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                ServiceCardGrid(
                  categoriesList: homeViewModel.categoriesList,
                  forHome: true,
                ),
                AdCard(
                  title: ' Stay at home \n to stop coronavirus',
                  buttonTitle: 'Know more',
                  backgroundColor: Colors.blue.shade900,
                  icon: Icons.charging_station,
                  onButtonTap: () {},
                )
              ]),
          floatingActionButton: SizedBox(
            height: screenHeight * 0.17,
            width: screenWidth * 0.17,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'assets/images/to-do.png',
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 30), // Replace with SizeConfig if needed
                child: InkWell(
                  onTap: () {
                    print("Home tapped");
                  },
                  child: SizedBox(
                    height: screenHeight * 0.03,
                    width: screenWidth * 0.05,
                    child: Image.asset('assets/images/home.png'),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  HomeViewModel.moveToCategoriesScreen(context);
                },
                child: SizedBox(
                  height: screenHeight * 0.03,
                  width: screenWidth * 0.05,
                  child: Image.asset('assets/images/categories.png'),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.06,
              ), // Replace with SizeConfig if needed
              InkWell(
                onTap: () {
                  HomeViewModel.moveToBookingOrderListingScreen(context);
                },
                child: SizedBox(
                  height: screenHeight * 0.04,
                  width: screenHeight * 0.06,
                  child: Image.asset('assets/images/booking.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 30), // Replace with SizeConfig if needed
                child: InkWell(
                  onTap: () {
                    HomeViewModel.moveToMyAccountScreen(context);
                  },
                  child: SizedBox(
                    height: screenHeight * 0.03,
                    width: screenWidth * 0.05,
                    child: Image.asset('assets/images/myaccount.png'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
