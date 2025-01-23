import 'dart:io';

import 'package:doorway/res/components/ExitDialog.dart';
import 'package:doorway/view/home_screen.dart';
import 'package:flutter/material.dart';

class ServiceMain extends StatefulWidget {
  final int? selectedIndex;

  const ServiceMain({Key? key, this.selectedIndex}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ServiceMainState createState() => _ServiceMainState();
}

class _ServiceMainState extends State<ServiceMain> {
  @override
  void initState() {
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      child: const HomeScreen(),
    );
  }
}
