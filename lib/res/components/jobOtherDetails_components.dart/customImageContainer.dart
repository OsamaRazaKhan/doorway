import 'package:doorway/res/color.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomImageContainer extends StatefulWidget {
  final bool hasImage;
  final int containerIndex;
  final double containerHeight;
  final double containerWidth;
  const CustomImageContainer({
    super.key,
    required this.hasImage,
    required this.containerIndex,
    required this.containerHeight,
    required this.containerWidth,
  });

  @override
  State<CustomImageContainer> createState() => _CustomImageContainerState();
}

class _CustomImageContainerState extends State<CustomImageContainer> {
  @override
  Widget build(BuildContext context) {
    final subServicesViewModel = Provider.of<SubServicesViewModel>(
      context,
    );
    return Stack(
      children: [
        SizedBox(
          height: widget.containerHeight,
          child: Container(
            width: widget.containerWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.shade200),
            child: widget.hasImage
                ? GestureDetector(
                    onTap: () {
                      subServicesViewModel.pickImage(context);
                    },
                    child: Image.file(
                      subServicesViewModel.images[widget.containerIndex],
                      fit: BoxFit.cover,
                    ),
                  )
                : widget.containerIndex == 4
                    ? Center(
                        child: GestureDetector(
                          onTap: () {
                            subServicesViewModel.pickImage(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 36.0,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 45.0,
                            ),
                          ),
                        ),
                      )
                    : Container(),
          ),
        ),
        Visibility(
          visible: widget.hasImage,
          child: Positioned(
            right: -15,
            top: -15,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                subServicesViewModel.removeImage(widget.containerIndex);
              },
            ),
          ),
        ),
      ],
    );
  }
}
