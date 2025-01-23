import 'package:cached_network_image/cached_network_image.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';
import '../../utils/SizeConfig.dart';

class MaintenanceInfo extends StatefulWidget {
  const MaintenanceInfo({Key? key}) : super(key: key);

  @override
  _MaintenanceInfoState createState() => _MaintenanceInfoState();
}

class _MaintenanceInfoState extends State<MaintenanceInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://unsplash.com/photos/a-house-in-the-middle-of-a-snowy-field-IED7T01FDDI',
                  // width: MediaQuery.of(context).size.width,
                  //height: 200,
                  height: SizeConfig.height160,
                  width: SizeConfig.width200,
                  placeholder: (context, url) => const SizedBox(
                      width: 25,
                      height: 25,
                      child: Center(child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomGoogleFontText(
                text: 'CategoryManager.category.title!',
                size: SizeConfig.width25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child:
                      // Html(
                      //   data: CategoryManager.category.description,
                      // ),
                      CustomGoogleFontText(
                    text: 'CategoryManager.category.description',
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: Container(),
            // ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: appColorButton(title: 'BOOK NOW'),
      ),
    );
  }

  Widget appColorButton({required String title}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: SizeConfig.height35,
          width: SizeConfig.screenWidth,
          margin: EdgeInsets.only(
            right: SizeConfig.width20,
            left: SizeConfig.width20,
            bottom: SizeConfig.height25,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primaryColor),
          child: Center(
              child: CustomGoogleFontText(
            text: title,
            color: Colors.white,
            size: SizeConfig.width15,
          ))),
    );
  }
}
