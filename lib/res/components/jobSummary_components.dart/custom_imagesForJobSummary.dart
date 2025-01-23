import 'package:carousel_slider/carousel_slider.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io'; // For File

class CustomImagesForJobSummary extends StatefulWidget {
  const CustomImagesForJobSummary({super.key});

  @override
  State<CustomImagesForJobSummary> createState() =>
      _CustomImagesForJobSummaryState();
}

class _CustomImagesForJobSummaryState extends State<CustomImagesForJobSummary> {
  @override
  Widget build(BuildContext context) {
    final subServicesViewModel = Provider.of<SubServicesViewModel>(
      context,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10),
      color: Colors.white,
      child: CarouselSlider.builder(
        itemCount: subServicesViewModel.images.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageIndex) {
          final File imageFile = subServicesViewModel.images[itemIndex];

          return Container(
            height: SizeConfig.height25,
            margin: EdgeInsets.all(SizeConfig.width10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15), // Updated for images
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Apply border radius
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          scrollDirection: Axis.horizontal,
          height: SizeConfig.height300,
          enableInfiniteScroll: false,
          onPageChanged: (value, reason) {},
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
