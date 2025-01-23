//........... New Model will be created.......//
import 'dart:developer';

class UserRewardListingModel {
  String? code;
  String? currentHouse;
  String? nextHouse;
  Reward? reward;

  UserRewardListingModel(
      {this.code, this.currentHouse, this.nextHouse, this.reward});

  UserRewardListingModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    currentHouse = json['current house'];
    nextHouse = json['next house'];
    log(currentHouse!);
    if (currentHouse != "") {
      reward =
          json['reward'] != null ? Reward.fromJson(json['reward']) : null;
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['code'] = this.code;
  //   data['current house'] = this.currentHouse;
  //   data['next house'] = this.nextHouse;
  //   if (this.reward != null) {
  //     data['reward'] = this.reward!.toJson();
  //   }
  //   return data;
  // }
}

class Reward {
  Type? type;
  Interval? interval;

  Reward({this.type, this.interval});

  Reward.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    interval = json['interval'] != null
        ? Interval.fromJson(json['interval'])
        : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.type != null) {
  //     data['type'] = this.type!.toJson();
  //   }
  //   if (this.interval != null) {
  //     data['interval'] = this.interval!.toJson();
  //   }
  //   return data;
  // }
}

class Type {
  String? discountType;
  String? silverPercentageDiscount;
  String? goldenPercentageDiscount;
  String? platinumPercentageDiscount;
  String? silverFixedDiscount;
  String? goldenFixedDiscount;
  String? platinumFixedDiscount;

  Type(
      {this.discountType,
      this.silverPercentageDiscount,
      this.goldenFixedDiscount,
      this.goldenPercentageDiscount,
      this.platinumFixedDiscount,
      this.platinumPercentageDiscount,
      this.silverFixedDiscount});

  Type.fromJson(Map<String, dynamic> json) {
    discountType = json['discount_type'];
    silverPercentageDiscount = json['silver_percentage_discount'];
    goldenPercentageDiscount = json['percentage_discount_value'];
    platinumPercentageDiscount = json['platinum_percentage'];
    silverFixedDiscount = json['silver_fixed_value'];
    goldenFixedDiscount = json['golden_fixed_value'];
    platinumFixedDiscount = json['platinum_fixed_value'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['discount_type'] = this.discountType;
  //   data['silver_percentage_discount'] = this.silverPercentageDiscount;
  //   return data;
  // }
}

class Interval {
  String? interval;
  String? expireyDate;

  Interval({this.interval, this.expireyDate});

  Interval.fromJson(Map<String, dynamic> json) {
    interval = json['interval'];
    expireyDate = json['expirey_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['interval'] = interval;
    data['expirey_date'] = expireyDate;
    return data;
  }
}
