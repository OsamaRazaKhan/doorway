// ignore_for_file: prefer_typing_uninitialized_variables

class VATModel {
  SimpleOrderCheck? simpleOrderCheck;
  WithRewardOrderCheck? withRewardOrderCheck;
  WithCouponOrderCheck? withCouponOrderCheck;

  VATModel(
      {this.simpleOrderCheck,
      this.withRewardOrderCheck,
      this.withCouponOrderCheck}) {
    SimpleOrderCheck tempSimpleOrderCheck = SimpleOrderCheck(
      finalValue: 0,
      total: 0,
      vatInclude: 0,
      vatValue: 0,
    );
    WithRewardOrderCheck tempwithRewardOrderCheck = WithRewardOrderCheck(
      claimable: 0,
      finalValue: 0,
      total: 0,
      vatInclude: 0,
      vatValue: 0,
      discount: '0',
    );
    WithCouponOrderCheck tempCouponCheck = WithCouponOrderCheck(
        couponDiscount: 0,
        finalValue: 0,
        subTotal: 0,
        total: 0,
        vatInclude: 0,
        vatValue: 0);
    simpleOrderCheck = tempSimpleOrderCheck;
    withRewardOrderCheck = tempwithRewardOrderCheck;
    withCouponOrderCheck = tempCouponCheck;
  }

  VATModel.fromJson(Map<String, dynamic> json) {
    simpleOrderCheck = json['simple_order_check'] != null
        ? SimpleOrderCheck.fromJson(json['simple_order_check'])
        : null;
    withRewardOrderCheck = json['with_reward_order_check'] != null
        ? WithRewardOrderCheck.fromJson(json['with_reward_order_check'])
        : null;
    withCouponOrderCheck = json['with_coupon_order_check'] != null
        ? WithCouponOrderCheck.fromJson(json['with_coupon_order_check'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (simpleOrderCheck != null) {
      data['simple_order_check'] = simpleOrderCheck!.toJson();
    }
    if (withRewardOrderCheck != null) {
      data['with_reward_order_check'] = withRewardOrderCheck!.toJson();
    }
    if (withCouponOrderCheck != null) {
      data['with_coupon_order_check'] = withCouponOrderCheck!.toJson();
    }
    return data;
  }
}

class SimpleOrderCheck {
  int? total;
  int? vatInclude;
  int? vatValue;
  var finalValue;

  SimpleOrderCheck(
      {this.total, this.vatInclude, this.vatValue, this.finalValue});

  SimpleOrderCheck.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    vatInclude = json['vat_include_%'];
    vatValue = json['vat_value'];
    finalValue = json['final_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['vat_include_%'] = vatInclude;
    data['vat_value'] = vatValue;
    data['final_value'] = finalValue;
    return data;
  }
}

class WithRewardOrderCheck {
  int? total;
  String? discount;
  int? claimable;
  RewardDetails? rewardDetails;
  int? vatInclude;
  int? vatValue;
  var finalValue;

  WithRewardOrderCheck(
      {this.total,
      this.discount,
      this.claimable,
      this.rewardDetails,
      this.vatInclude,
      this.vatValue,
      this.finalValue});

  WithRewardOrderCheck.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    discount = json['discount'];
    claimable = json['claimable'];
    rewardDetails = json['reward_details'] != null
        ? RewardDetails.fromJson(json['reward_details'])
        : null;
    vatInclude = json['vat_include_%'];
    vatValue = json['vat_value'];
    finalValue = json['final_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['discount'] = discount;
    data['claimable'] = claimable;
    if (rewardDetails != null) {
      data['reward_details'] = rewardDetails!.toJson();
    }
    data['vat_include_%'] = vatInclude;
    data['vat_value'] = vatValue;
    data['final_value'] = finalValue;
    return data;
  }
}

class RewardDetails {
  String? rewardType;
  String? rewardDiscountType;
  String? platinumFixedValue;
  String? message;

  RewardDetails(
      {this.rewardType,
      this.rewardDiscountType,
      this.platinumFixedValue,
      this.message});

  RewardDetails.fromJson(Map<String, dynamic> json) {
    rewardType = json['reward_type'];
    rewardDiscountType = json['reward_discount_type'];
    platinumFixedValue = json['platinum_fixed_value'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reward_type'] = rewardType;
    data['reward_discount_type'] = rewardDiscountType;
    data['platinum_fixed_value'] = platinumFixedValue;
    data['message'] = message;
    return data;
  }
}

class WithCouponOrderCheck {
  int? subTotal;
  int? couponDiscount;
  int? total;
  int? vatInclude;
  int? vatValue;
  var finalValue;

  WithCouponOrderCheck(
      {this.subTotal,
      this.couponDiscount,
      this.total,
      this.vatInclude,
      this.vatValue,
      this.finalValue});

  WithCouponOrderCheck.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
    couponDiscount = json['coupon_discount'];
    total = json['total'];
    vatInclude = json['vat_include_%'];
    vatValue = json['vat_value'];
    finalValue = json['final_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_total'] = subTotal;
    data['coupon_discount'] = couponDiscount;
    data['total'] = total;
    data['vat_include_%'] = vatInclude;
    data['vat_value'] = vatValue;
    data['final_value'] = finalValue;
    return data;
  }
}

// class VATModel {
//   WithoutReward? withoutReward;
//   WithReward? withReward;

//   VATModel({this.withoutReward, this.withReward}) {
//     WithReward tempWithReward = WithReward(
//         claimable: 0,
//         discount: '0',
//         finalValue: 0,
//         total: 0,
//         vatInclude: 0,
//         vatValue: 0);
//     WithoutReward tempWithoutReward =
//         WithoutReward(finalValue: 0, total: 0, vatInclude: 0, vatValue: 0);
//     this.withoutReward = tempWithoutReward;
//     this.withReward = tempWithReward;
//   }

//   VATModel.fromJson(Map<String, dynamic> json) {
//     withoutReward = json['without_reward'] != null
//         ? new WithoutReward.fromJson(json['without_reward'])
//         : null;
//     withReward = json['with_reward'] != null
//         ? new WithReward.fromJson(json['with_reward'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.withoutReward != null) {
//       data['without_reward'] = this.withoutReward!.toJson();
//     }
//     if (this.withReward != null) {
//       data['with_reward'] = this.withReward!.toJson();
//     }
//     return data;
//   }
// }

// class WithoutReward {
//   int? total;
//   int? vatInclude;
//   int? vatValue;
//   var finalValue;

//   WithoutReward({this.total, this.vatInclude, this.vatValue, this.finalValue});

//   WithoutReward.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     vatInclude = json['vat_include_%'];
//     vatValue = json['vat_value'];
//     finalValue = json['final_value'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['vat_include_%'] = this.vatInclude;
//     data['vat_value'] = this.vatValue;
//     data['final_value'] = this.finalValue;
//     return data;
//   }
// }

// class WithReward {
//   int? total;
//   String? discount;
//   int? claimable;
//   RewardDetails? rewardDetails;
//   int? vatInclude;
//   int? vatValue;
//   var finalValue;

//   WithReward(
//       {this.total,
//       this.discount,
//       this.claimable,
//       this.rewardDetails,
//       this.vatInclude,
//       this.vatValue,
//       this.finalValue});

//   WithReward.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     discount = json['discount'];
//     claimable = json['claimable'];
//     rewardDetails = json['reward_details'] != null
//         ? new RewardDetails.fromJson(json['reward_details'])
//         : null;
//     vatInclude = json['vat_include_%'];
//     vatValue = json['vat_value'];
//     finalValue = json['final_value'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['discount'] = this.discount;
//     data['claimable'] = this.claimable;
//     if (this.rewardDetails != null) {
//       data['reward_details'] = this.rewardDetails!.toJson();
//     }
//     data['vat_include_%'] = this.vatInclude;
//     data['vat_value'] = this.vatValue;
//     data['final_value'] = this.finalValue;
//     return data;
//   }
// }

// class RewardDetails {
//   String? rewardType;
//   String? rewardDiscountType;
//   String? message;

//   RewardDetails({this.rewardType, this.rewardDiscountType, this.message});

//   RewardDetails.fromJson(Map<String, dynamic> json) {
//     rewardType = json['reward_type'];
//     rewardDiscountType = json['reward_discount_type'];
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['reward_type'] = this.rewardType;
//     data['reward_discount_type'] = this.rewardDiscountType;
//     data['message'] = this.message;
//     return data;
//   }
// }
