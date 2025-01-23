class VendorsModel {
  int? id;
  bool? isFeatured;
  String? name;
  String? arName;
  String? description;
  String? arDescription;
  String? image;
  String? email;
  String? phone;
  String? website;
  String? location;
  String? lat;
  String? long;
  int? overallRating;
  int? reviewsCount;
  int? staff;
  int? timing;
  bool isSelected;
  int? categoriesCount;
  String? covidCharges;
  String? pickupCharges;
  String? cleaninMaterialCharges;
  String? ironingCharges;

  int? hasAttributes;
  Map<String, dynamic>? attributes;
  int? additionalCost;
  int? normalDeliveryDays;

  VendorsModel(
      {this.id,
      this.isFeatured,
      this.name,
      this.arName,
      this.description,
      this.arDescription,
      this.image,
      this.email,
      this.phone,
      this.website,
      this.location,
      this.lat,
      this.overallRating,
      this.reviewsCount,
      this.staff,
      this.timing,
      this.covidCharges,
      this.isSelected = false,
      this.categoriesCount,
      this.cleaninMaterialCharges,
      this.ironingCharges,
      this.pickupCharges,
      this.long,
      this.attributes,
      this.hasAttributes,
      this.additionalCost,
      this.normalDeliveryDays});
}
