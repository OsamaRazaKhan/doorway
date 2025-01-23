class RewardListingModel {
  String? page;
  String? limit;
  int? pageCount;
  int? totalCount;
  List<RewardsData>? rewardsData = [];

  RewardListingModel(
      {this.page,
      this.limit,
      this.pageCount,
      this.totalCount,
      this.rewardsData});

  RewardListingModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    pageCount = json['page_count'];
    totalCount = json['total_count'];
    if (json['rewards_data'] != null) {
      rewardsData = <RewardsData>[];
      json['rewards_data'].forEach((v) {
        rewardsData!.add(RewardsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['page_count'] = pageCount;
    data['total_count'] = totalCount;
    if (rewardsData != null) {
      data['rewards_data'] = rewardsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RewardsData {
  int? id;
  String? vendorId;
  String? silverPunches;
  String? silverFixedValue;
  String? silverDiscountPercentage;
  String? goldenPunches;
  String? goldenFixedValue;
  String? goldenDiscountPercentage;
  String? platinumPunches;
  String? platinumFixedValue;
  String? platinumDiscountPercentage;
  String? minOrderValue;
  String? fixedValue;
  String? intervals;
  String? startTime;
  String? endTime;

  RewardsData(
      {this.id,
      this.vendorId,
      this.silverPunches,
      this.silverFixedValue,
      this.silverDiscountPercentage,
      this.goldenPunches,
      this.goldenFixedValue,
      this.goldenDiscountPercentage,
      this.platinumPunches,
      this.platinumFixedValue,
      this.platinumDiscountPercentage,
      this.minOrderValue,
      this.fixedValue,
      this.intervals,
      this.startTime,
      this.endTime});

  RewardsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    silverPunches = json['silver_punches'];
    silverFixedValue = json['silver_fixed_value'];
    silverDiscountPercentage = json['silver_discount_percentage'];
    goldenPunches = json['golden_punches'];
    goldenFixedValue = json['golden_fixed_value'];
    goldenDiscountPercentage = json['golden_discount_percentage'];
    platinumPunches = json['platinum_punches'];
    platinumFixedValue = json['platinum_fixed_value'];
    platinumDiscountPercentage = json['platinum_discount_percentage'];
    minOrderValue = json['min_order_value'];
    fixedValue = json['fixed_value'];
    intervals = json['intervals'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vendor_id'] = vendorId;
    data['silver_punches'] = silverPunches;
    data['silver_fixed_value'] = silverFixedValue;
    data['silver_discount_percentage'] = silverDiscountPercentage;
    data['golden_punches'] = goldenPunches;
    data['golden_fixed_value'] = goldenFixedValue;
    data['golden_discount_percentage'] = goldenDiscountPercentage;
    data['platinum_punches'] = platinumPunches;
    data['platinum_fixed_value'] = platinumFixedValue;
    data['platinum_discount_percentage'] = platinumDiscountPercentage;
    data['min_order_value'] = minOrderValue;
    data['fixed_value'] = fixedValue;
    data['intervals'] = intervals;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}
