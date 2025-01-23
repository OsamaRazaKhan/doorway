import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doorway/res/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Model/VendorsModel.dart';
import '../../res/components/CustomGoogleFontText.dart';
import '../../utils/SizeConfig.dart';
import 'main_screen.dart';

class HandyManVendorSelection extends StatefulWidget {
  const HandyManVendorSelection({Key? key}) : super(key: key);

  @override
  _VendorSelectionState createState() => _VendorSelectionState();
}

class _VendorSelectionState extends State<HandyManVendorSelection> {
  List<VendorsModel> vendors = [
    VendorsModel(
      id: 1,
      isFeatured: true,
      name: "Vendor One",
      arName: "البائع واحد",
      description: "High-quality vendor services.",
      arDescription: "خدمات بائع عالية الجودة.",
      image: "https://example.com/image1.jpg",
      email: "vendor1@example.com",
      phone: "+1234567890",
      website: "https://vendor1.com",
      location: "City Center",
      lat: "24.7136",
      long: "46.6753",
      overallRating: 4,
      reviewsCount: 120,
      staff: 10,
      timing: 9,
      isSelected: false,
      categoriesCount: 5,
      covidCharges: "50",
      pickupCharges: "30",
      cleaninMaterialCharges: "20",
      ironingCharges: "10",
    ),
  ];
  bool showContinueButton = false;
  late VendorsModel selectedVendor;

  int vendorsSelected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CustomGoogleFontText(
          text: 'Vendor Selection',
          size: SizeConfig.width17,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () async {
                final r1 = await showOkCancelAlertDialog(
                  context: context,
                  title: 'Confirmation',
                  message: 'Are you sure you want to exit?',
                  okLabel: 'Yes',
                  cancelLabel: 'No',
                );

                log(r1.index.toString());
                if (r1.index == 0) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const ServiceMain(
                                selectedIndex: 0,
                              )),
                      (route) => false);
                }

                //Navigator.of(context).pop();
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            color: Colors.red,
          )
        ],
      ),
    );
  }

  Widget vendorItem({required VendorsModel vendor, required int index}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: vendors[index].isSelected
          ? AppColors.primaryColorWithOpacity
          : Colors.white,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: vendor.image!,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: vendorInfo(
                        name: vendor.name!,
                        staff: vendor.categoriesCount!,
                        time: vendor.timing!,
                        overallRating: vendor.overallRating!,
                        locationName: vendor.location!,
                        reviewsCount: vendor.reviewsCount!)),
                GestureDetector(
                  onTap: () async {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor),
                    child: const CustomGoogleFontText(
                      text: 'Book now',
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: CustomGoogleFontText(
              text: vendor.description!,
              size: 12,
              color: Colors.grey.shade700,
              overflow: TextOverflow.ellipsis,
              maxline: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget vendorInfo({
    required String name,
    required int staff,
    required int time,
    required int overallRating,
    required String locationName,
    required int reviewsCount,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomGoogleFontText(
              text: name,
              size: SizeConfig.width12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              width: SizeConfig.width2,
            ),
            RatingBar.builder(
              minRating: 1,
              initialRating: overallRating.toDouble(),
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 10,
              ignoreGestures: true,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                size: 10,
                color: AppColors.primaryColor,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(
              width: SizeConfig.width2,
            ),
            CustomGoogleFontText(
              text: '($reviewsCount)',
              size: SizeConfig.width8,
              color: Colors.grey.shade700,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomGoogleFontText(
          text: '$staff Categories',
          size: 12,
          color: Colors.grey.shade700,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomGoogleFontText(
          text: locationName,
          size: 12,
          color: Colors.grey.shade700,
        ),
      ],
    );
  }

  Widget appColorButton({required String title}) {
    return GestureDetector(
      onTap: () {
        String vendorsString = '';
        for (var element in vendors) {
          if (element.isSelected) {
            vendorsString += element.id.toString();
            vendorsString += ',';
          }
        }

        vendorsString = vendorsString.substring(0, vendorsString.length - 1);
        print('vendors : $vendorsString');
      },
      child: Container(
          margin:
              const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.primaryColor,
          ),
          alignment: Alignment.center,
          child: CustomGoogleFontText(
            text: title,
            size: 17,
            color: Colors.white,
          )),
    );
  }
}
