class ProductsModel {
  int? id;
  String? name;
  String? arName;
  String? description;
  String? arDescription;
  String? price;
  String? image;
  bool isSelected;
  int quantity;
  int? subCatID;

  ProductsModel(
      {this.arDescription,
      this.arName,
      this.description,
      this.id,
      this.image,
      this.name,
      this.price,
      this.quantity = 0,
      this.isSelected = false,
      this.subCatID});
}
