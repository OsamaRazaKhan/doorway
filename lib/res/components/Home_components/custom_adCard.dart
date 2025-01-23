import 'package:flutter/material.dart';

class AdCard extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback? onButtonTap;

  const AdCard({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.backgroundColor,
    required this.icon,
    this.onButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: onButtonTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Text(
                    buttonTitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
        ],
      ),
    );
  }
}
