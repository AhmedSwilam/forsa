import 'dart:convert';

List<SubCategoriesModel> subCategoriesModelFromJson(String str) => List<SubCategoriesModel>.from(json.decode(str).map((x) => SubCategoriesModel.fromJson(x)));

String subCategoriesModelToJson(List<SubCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoriesModel {
  SubCategoriesModel({
    this.id,
    this.nameEn,
    this.nameAr,
    this.photo,
    this.categoryId,
  });

  int id;
  String nameEn;
  String nameAr;
  dynamic photo;
  int categoryId;

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) => SubCategoriesModel(
    id: json["id"],
    nameEn: json["nameEn"],
    nameAr: json["nameAr"],
    photo: json["photo"],
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameEn": nameEn,
    "nameAr": nameAr,
    "photo": photo,
    "categoryId": categoryId,
  };
}
