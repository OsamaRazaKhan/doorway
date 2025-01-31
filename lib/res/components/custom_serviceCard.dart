import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ServiceCard extends StatelessWidget {
  final String titleName;
  final String imagePath;
  final Function()? onTap;

  const ServiceCard({
    Key? key,
    required this.titleName,
    required this.imagePath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: SizeConfig.width250,
            height: SizeConfig.height250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                width: SizeConfig.width250,
                height: SizeConfig.height300,
                fit: BoxFit.fill,
                placeholder: (context, url) => SizedBox(
                  width: SizeConfig.width25,
                  height: SizeConfig.height25,
                  child: const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            bottom:
                0, // Replace `SizeConfig.height8` with a constant or variable
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(
                child: Text(
                  titleName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
