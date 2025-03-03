import 'package:ecommerce/core/models/category_model.dart';

class CartProductModel {
  final String id;
  final String title;
  final String imageCover;
  final CategoryModel category;
  final CategoryModel brand;
  final double ratingsAverage;

  CartProductModel({
    required this.id,
    required this.title,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) => CartProductModel(
    id: json["_id"],
    title: json["title"],
    imageCover: json["imageCover"],
    category: CategoryModel.fromJson(json["category"]),
    brand: CategoryModel.fromJson(json["brand"]),
    ratingsAverage: json["ratingsAverage"]?.toDouble(),
  );

  // Map<String, dynamic> toJson() => {
  //   "subcategory": List<dynamic>.from(subcategory.map((x) => x.toJson())),
  //   "_id": id,
  //   "title": title,
  //   "quantity": quantity,
  //   "imageCover": imageCover,
  //   "category": category.toJson(),
  //   "brand": brand.toJson(),
  //   "ratingsAverage": ratingsAverage,
  //   "id": productId,
  // };
}