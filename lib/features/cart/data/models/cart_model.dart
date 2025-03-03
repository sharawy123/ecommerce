import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';

class CartModel {
  final String? id;
  final String? cartOwner;
  final List<CartItemModel> items;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int totalCartPrice;

  CartModel({
    required this.id,
    required this.cartOwner,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["_id"] as String?,
        cartOwner: json["cartOwner"] as String?,
    items: List<CartItemModel>.from(
      (json["items"] as List? ?? []).map((item) => CartItemModel.fromJson(item)),
    ),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] as int?,
        totalCartPrice: json["totalCartPrice"],
      );

}
