import 'dart:async';
import 'package:doorway/Model/CategoriesModel.dart';
import 'package:doorway/res/components/custom_serviceCard.dart';
import 'package:doorway/res/components/global_components/custom_showLoading.dart';
import 'package:doorway/res/components/global_components/custom_somethingWrong.dart';
import 'package:doorway/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceCardGrid extends StatefulWidget {
  final List<CategoriesModel> categoriesList;
  final bool forHome;
  const ServiceCardGrid({
    Key? key,
    required this.categoriesList,
    required this.forHome,
  }) : super(key: key);

  @override
  State<ServiceCardGrid> createState() => _ServiceCardGridState();
}

class _ServiceCardGridState extends State<ServiceCardGrid> {
  bool showLoading = true;

  @override
  void initState() {
    super.initState();

    // Start a timer for 20 seconds
    Timer(const Duration(seconds: 25), () {
      if (widget.categoriesList.isEmpty) {
        setState(() {
          showLoading = false; // Stop showing the loading indicator
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Container(
      height: 330,
      margin: const EdgeInsets.only(left: 20),
      child: showLoading && widget.categoriesList.isEmpty
          ? const CustomShowLoading(title: "Loading categories...")
          : widget.categoriesList.isEmpty
              ? const CustomSomethingWrong() // Empty container after 20 seconds
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.forHome == true ? 2 : 3,
                    crossAxisSpacing: widget.forHome == true ? 10 : 3,
                    mainAxisSpacing: widget.forHome == true ? 10 : 3,
                    childAspectRatio: 1,
                  ),
                  scrollDirection:
                      widget.forHome == true ? Axis.horizontal : Axis.vertical,
                  padding: const EdgeInsets.only(right: 10),
                  itemCount: widget.categoriesList.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        homeViewModel
                            .setSelectedCategory(widget.categoriesList[index]);
                        Map<String, dynamic> arguments = {
                          "wannaPlaceOrder": true
                        };
                        HomeViewModel.moveToSavedAddresses(context, arguments);
                      },
                      child: ServiceCard(
                        titleName:
                            widget.categoriesList[index].title ?? 'No Title',
                        imagePath: widget.categoriesList[index].image ?? '',
                      ),
                    );
                  },
                ),
    );
  }
}
