import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/res/components/global_components/custom_serviceCardGrid.dart';
import 'package:doorway/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/CategoriesModel.dart';
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
      appBar: shopAppbarBack('Categories', context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.height50,
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
