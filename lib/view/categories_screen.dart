import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/custom_serviceCardGrid.dart';
import 'package:doorway/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/CategoriesModel.dart';
import '../res/components/CustomGoogleFontText.dart';
import '../utils/SizeConfig.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<CategoriesModel> categoriesList = [];

  @override
  void initState() {
    super.initState();
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    if (homeViewModel.categoriesList.isEmpty) homeViewModel.GetCategories({});
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: AppColors.appbarColor,
        elevation: 0,
        title: CustomGoogleFontText(
          text: 'Categories',
          size: SizeConfig.width17,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.height20,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ServiceCardGrid(
                categoriesList: homeViewModel.categoriesList,
                forHome: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
