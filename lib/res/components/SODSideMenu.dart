import 'dart:math' as math;

import 'package:doorway/res/color.dart';
import 'package:flutter/material.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/blinking_dot.dart';
import 'CustomGoogleFontText.dart';

Drawer sodSideMenu(String name, String email, context, Function() logout,
    bool notificationBlink) {
  return Drawer(
    child: SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.width10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: SizeConfig.height12)),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeConfig.width15),
                    child: CustomGoogleFontText(
                      text: name,
                      size: SizeConfig.width19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: SizeConfig.height5)),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeConfig.width15),
                    child: CustomGoogleFontText(
                      text: email,
                      color: Colors.black54,
                      size: SizeConfig.width11,
                    )),
                ListTile(
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomGoogleFontText(
                        text: 'Notifications',
                        size: SizeConfig.width15,
                        color: Colors.black,
                      ),
                      SizedBox(width: SizeConfig.width10),
                      notificationBlink
                          ? const BlinkingDot()
                          : const SizedBox.shrink(),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: CustomGoogleFontText(
                    text: 'Offers',
                    size: SizeConfig.width15,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: CustomGoogleFontText(
                    text: 'Vouchers',
                    size: SizeConfig.width15,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: CustomGoogleFontText(
                    text: 'Companies',
                    size: SizeConfig.width15,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                  ),
                  onTap: () {
                    // pushNewScreenWithRouteSettings(context,
                    //     screen: const AllCompaniesScreenPage(),
                    //     withNavBar: false,
                    //     pageTransitionAnimation:
                    //         PageTransitionAnimation.cupertino,
                    //     settings:
                    //         const RouteSettings(name: 'AllCompaniesScreenPage'));
                  },
                ),
                ListTile(
                  title: CustomGoogleFontText(
                    text: 'FAQ\'s',
                    size: SizeConfig.width15,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.width10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: SizeConfig.height5)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.width15),
                  child: CustomGoogleFontText(
                    text: 'Tell us what you think',
                    fontWeight: FontWeight.w900,
                    size: SizeConfig.width15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: SizeConfig.height5),
                GestureDetector(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeConfig.width15),
                    child: CustomGoogleFontText(
                      text: 'Help us improve the app',
                      size: SizeConfig.width15,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.height10),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeConfig.width15),
                    child: CustomGoogleFontText(
                      text: 'Rate the app',
                      size: SizeConfig.width15,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.height10),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: SizeConfig.width15),
                      child: CustomGoogleFontText(
                        text: 'Terms & Policies',
                        size: SizeConfig.width15,
                        color: Colors.black,
                      )),
                ),
                SizedBox(height: SizeConfig.height170),
                "".isEmpty
                    ? const SizedBox.shrink()
                    : Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.width10,
                            vertical: SizeConfig.height10),
                        width: double.infinity,
                        height: SizeConfig.height60,
                        child: ElevatedButton(
                          onPressed: logout,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: const Icon(Icons.logout),
                              ),
                              CustomGoogleFontText(
                                text: '  Log out',
                                size: SizeConfig.width15,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
        ],
      ),
    ),
  );
}

Widget borderLine() {
  return Container(
    color: Colors.black,
    child: const SizedBox(
      width: double.infinity,
      height: 1,
    ),
  );
}
