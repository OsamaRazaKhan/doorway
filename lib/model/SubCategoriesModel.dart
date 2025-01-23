import 'SevicesModel.dart';

class SubCategoriesModel {
  bool? isSelected = false;
  int? id;
  String? title;
  String? arTitle;
  String? description;
  String? arDescription;
  String? image;
  String? time;
  String? hasServices;
  String? catId;
  int? hasAttributes;
  int? callOutPrice;
  String? callOutText;
  int? smallPrice;
  int? mediumPrice;
  int? largePrice;

  String? staticID;
  String? type;
  int? hasBrands;
  List? brands;
  List<ServicesModel> laundryServices = [];
  ServicesModel? selectedLaundryService;

  SubCategoriesModel(
      {this.id,
      this.isSelected,
      this.title,
      this.arTitle,
      this.description,
      this.arDescription,
      this.time,
      this.hasServices,
      this.catId,
      this.image,
      this.callOutPrice,
      this.callOutText,
      this.hasAttributes,
      this.largePrice,
      this.mediumPrice,
      this.smallPrice,
      this.hasBrands,
      this.brands,
      this.staticID,
      this.type});
}
