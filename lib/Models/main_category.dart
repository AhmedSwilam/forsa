// To parse this JSON data, do
//
//     final mainCategoriesModel = mainCategoriesModelFromJson(jsonString);

import 'dart:convert';

List<MainCategoriesModel> mainCategoriesModelFromJson(String str) =>
    List<MainCategoriesModel>.from(json.decode(str).map((x) => MainCategoriesModel.fromJson(x)));

String mainCategoriesModelToJson(List<MainCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MainCategoriesModel {
  int id;
  String nameEn;
  String nameAr;
  dynamic photo;
  int mainCategoryId;

  MainCategoriesModel({
    this.id,
    this.nameEn,
    this.nameAr,
    this.photo,
    this.mainCategoryId,
  });

  factory MainCategoriesModel.fromJson(Map<String, dynamic> json) => MainCategoriesModel(
    id: json["id"],
    nameEn: json["nameEn"],
    nameAr: json["nameAr"],
    photo: json["photo"],
    mainCategoryId: json["mainCategoryId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameEn": nameEn,
    "nameAr": nameAr,
    "photo": photo,
    "mainCategoryId": mainCategoryId,
  };
}
