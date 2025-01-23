class CategoriesModel {
  int? id;
  String? title;
  String? arTitle;
  String? description;
  String? arDescription;
  String? image;
  String? banImage;

  CategoriesModel(
      {this.id,
      this.title,
      this.arTitle,
      this.description,
      this.arDescription,
      this.banImage,
      this.image});

  CategoriesModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    title = map['title']?.toString() ?? "";
    arTitle = map['ar_title']?.toString() ?? "";
    description = map['description']?.toString() ?? "";
    arDescription = map['ar_description']?.toString() ?? "";
    image = map['image']?.toString() ?? "";
    banImage = map['ban_image']?.toString() ?? "";
  }
}
