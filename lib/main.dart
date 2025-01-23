import 'package:doorway/global.dart';
import 'package:doorway/view_model/home_view_model.dart';
import 'package:doorway/view_model/location_view_model.dart';
import 'package:doorway/view_model/myBooking_view_model.dart';
import 'package:doorway/view_model/myDetails_view_model.dart';
import 'package:doorway/view_model/orderDetails_view_model.dart';
import 'package:doorway/view_model/order_view_model.dart';
import 'package:doorway/view_model/schedule_view_model.dart';
import 'package:doorway/view_model/services_view_model.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:doorway/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';
import 'view_model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => LocationViewModel()),
        ChangeNotifierProvider(create: (_) => ServicesViewModel()),
        ChangeNotifierProvider(create: (_) => SubServicesViewModel()),
        ChangeNotifierProvider(create: (_) => ScheduleViewModel()),
        ChangeNotifierProvider(create: (_) => OrderViewModel()),
        ChangeNotifierProvider(create: (_) => MyBookingsViewModel()),
        ChangeNotifierProvider(create: (_) => OrderdetailsViewModel()),
        ChangeNotifierProvider(create: (_) => MyDetailsViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splash_screen,
        onGenerateRoute: Routes.generateRoute,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
