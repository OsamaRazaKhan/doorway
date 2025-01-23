import 'package:carousel_slider/carousel_slider.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomLadderContainer extends StatefulWidget {
  const CustomLadderContainer({
    Key? key,
  }) : super(key: key);

  @override
  _CustomLadderContainerState createState() => _CustomLadderContainerState();
}

class _CustomLadderContainerState extends State<CustomLadderContainer> {
  final List<String> options = ['No', 'Yes - 6ft', 'Yes - 8ft'];

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
        itemCount: options.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageIndex) {
          return GestureDetector(
            onTap: () {
              subServicesViewModel.setLadderOption(options[itemIndex]);
            },
            child: Container(
              height: SizeConfig.height25,
              margin: EdgeInsets.all(SizeConfig.width10),
              decoration: BoxDecoration(
                color: subServicesViewModel.SelectedLadderOption ==
                        options[itemIndex]
                    ? AppColors.primaryColor
                    : Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                options[itemIndex],
                style: TextStyle(
                  fontSize: SizeConfig.width16,
                  color: subServicesViewModel.SelectedLadderOption ==
                          options[itemIndex]
                      ? Colors.white
                      : AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          scrollDirection: Axis.horizontal,
          height: SizeConfig.height50,
          enableInfiniteScroll: false,
          onPageChanged: (value, reason) {},
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeCenterPage: true,
          viewportFraction: 0.3,
        ),
      ),
    );
  }
}
