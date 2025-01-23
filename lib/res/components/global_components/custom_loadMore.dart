import 'package:doorway/res/color.dart';
import 'package:doorway/view_model/myBooking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomLoadmore extends StatelessWidget {
  final bool forLive;
  const CustomLoadmore({super.key, required this.forLive});

  @override
  Widget build(BuildContext context) {
    final myBookingsViewModel = Provider.of<MyBookingsViewModel>(context);
    return forLive
        ? Container(
            child: myBookingsViewModel.LoadMoreLive
                ? const CircularProgressIndicator()
                : Text(
                    'Load More',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
          )
        : Container(
            child: myBookingsViewModel.LoadMoreHistory
                ? const CircularProgressIndicator()
                : Text(
                    'Load More',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
          );
  }
}
