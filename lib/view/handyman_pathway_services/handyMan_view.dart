import 'dart:async';
import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/res/components/handyMan_components.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/home_view_model.dart';
import 'package:doorway/view_model/services_view_model.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class HandyManScreen extends StatefulWidget {
  const HandyManScreen({Key? key}) : super(key: key);
  @override
  _HandyManScreenState createState() => _HandyManScreenState();
}

class _HandyManScreenState extends State<HandyManScreen> {
  bool showLoading = true;

  @override
  void initState() {
    super.initState();
    final servicesViewModel =
        Provider.of<ServicesViewModel>(context, listen: false);
    Timer(const Duration(seconds: 25), () {
      if (servicesViewModel.servicesList.isEmpty) {
        setState(() {
          showLoading = false; // Stop showing the loading indicator
        });
      }
    });
    servicesViewModel.CheckForServices(context);
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final servicesViewModel = Provider.of<ServicesViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: shopAppbarBack(homeViewModel.selectedCategory!.title, context,
          isBackEnable: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: SizeConfig.height20,
          ),
          Expanded(
            child: Container(
              child: ModalProgressHUD(
                inAsyncCall:
                    false, // Remove state-dependent logic for the loading indicator
                child: showLoading && servicesViewModel.servicesList.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeConfig.height50,
                              width: SizeConfig.width50,
                              child: CircularProgressIndicator(
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.blueAccent),
                                strokeWidth: SizeConfig.width4,
                              ),
                            ),
                            SizedBox(height: SizeConfig.height20),
                            const Text(
                              "Loading services...",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : servicesViewModel.servicesList.isEmpty
                        ? Center(
                            child: AnimatedOpacity(
                              opacity: 1.0,
                              duration: const Duration(seconds: 1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.sentiment_dissatisfied,
                                    size: 80,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: SizeConfig.height20),
                                  const Text(
                                    "Something went wrong!",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ) // Empty container after 20 seconds
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1.8,
                            ),
                            itemCount: servicesViewModel.servicesList.length,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            itemBuilder: (ctx, index) {
                              return typeCard(
                                servicesViewModel,
                                title: servicesViewModel
                                    .servicesList[index].title!,
                                index: index,
                                onPress: () {
                                  servicesViewModel.setSelectedService(
                                      servicesViewModel.servicesList[index]);
                                  servicesViewModel.clearAllStates();
                                  ServicesViewModel.moveToSubServicesScreen(
                                      context);
                                },
                              );
                            },
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
