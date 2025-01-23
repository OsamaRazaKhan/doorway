import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/res/components/rewards_components/custom_rewardsFirstBlock.dart';
import 'package:doorway/res/components/rewards_components/custom_rewardsThirdBlock.dart';
import 'package:doorway/res/components/rewards_components/custom_rewardsSecondBlock.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: shopAppbarBack('Rewards', context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.height20,
            ),
            const CustomRewardsFirstBlock(),
            SizedBox(
              height: SizeConfig.height30,
            ),
            const CustomRewardsSecondBlock(),
            SizedBox(
              height: SizeConfig.height10,
            ),
            const CustomRewardsThirdBlock(),
          ],
        ),
      ),
    );
  }
}
