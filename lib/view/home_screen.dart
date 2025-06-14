import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX tutorials'),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text('GetX Dialog Alert'),
              subtitle: const Text('GetX Dialog Alert with getx'),
              onTap: () {
                Get.defaultDialog(
                  title: 'Delete Chat',
                  titlePadding: const EdgeInsets.only(top: 10),
                  contentPadding: const EdgeInsets.all(20),
                  middleText: 'Are you sure you wanna delte this chat',
                  // textConfirm: 'Yes',
                  // textCancel: 'No',
                  confirm: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK')),
                  cancel: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('GetX Bottom Sheet'),
              subtitle: const Text('GetX bottom sheet to change theme'),
              onTap: () {
                Get.bottomSheet(Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.light_mode),
                        title: const Text('Light Theme'),
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.dark_mode),
                        title: const Text('Dark Theme'),
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                        },
                      ),
                    ],
                  ),
                ));
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.snackbar('Osama Raza', 'This is Getx Learning',
            colorText: Colors.blue,
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            icon: const Icon(Icons.add));
      }),
    );
  }
}
