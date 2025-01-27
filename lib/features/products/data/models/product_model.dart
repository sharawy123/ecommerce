import 'brand_model.dart';
class ProductModel {
  final String ID;
  final int sold;
  final List<String> images;
  final int ratingsQuantity;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final String imageCover;
  final BrandModel category;
  final BrandModel brand;
  final double ratingsAverage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String datumId;
  final List<dynamic> availableColors;
  final int? priceAfterDiscount;

  ProductModel({
  required  this.sold,
  required  this.images,
  required  this.ratingsQuantity,
  required this.ID,
  required  this.title,
  required  this.slug,
  required  this.description,
  required  this.quantity,
  required  this.price,
  required  this.imageCover,
  required  this.category,
  required  this.brand,
  required  this.ratingsAverage,
  required  this.createdAt,
  required  this.updatedAt,
  required  this.datumId,
  required  this.availableColors,
  required  this.priceAfterDiscount,
  });


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
  sold: json["sold"],
    images: List<String>.from(json["images"].map((x) => x.toString())),
    ratingsQuantity: json["ratingsQuantity"],
    ID: json["_id"],
  title: json["title"],
  slug: json["slug"],
  description: json["description"],
  quantity: json["quantity"],
  price: json["price"],
  imageCover: json["imageCover"],
  category: BrandModel.fromJson(json["category"]),
  brand: BrandModel.fromJson(json["brand"]),
  ratingsAverage: json["ratingsAverage"]?.toDouble(),
  createdAt: DateTime.parse(json["createdAt"]),
  updatedAt: DateTime.parse(json["updatedAt"]),
  datumId: json["id"],
  priceAfterDiscount: json["priceAfterDiscount"] as int ?,
    availableColors: json["availableColors"] == null
        ? []
        : List<dynamic>.from(json["availableColors"].map((x) => x)),

  );
}