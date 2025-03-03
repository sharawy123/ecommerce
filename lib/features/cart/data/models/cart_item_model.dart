import 'cart_product_model.dart';

class CartItemModel {
  final int count;
  final String id;
  final CartProductModel product;
  final int price;

  CartItemModel({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    count: json["count"],
    id: json["_id"],
    product: CartProductModel.fromJson(json["product"]),
    price: json["price"],
  );

  // Map<String, dynamic> toJson() => {
  //   "count": count,
  //   "_id": id,
  //   "product": product.toJson(),
  //   "price": price,
  // };
}