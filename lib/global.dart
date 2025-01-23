import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
double screenHeight = MediaQuery.of(navigatorKey.currentContext!).size.height;
double screenWidth = MediaQuery.of(navigatorKey.currentContext!).size.width;
