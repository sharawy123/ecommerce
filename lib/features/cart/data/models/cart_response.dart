import 'cart_model.dart';

class CartResponse {
  final String status;
  final int numOfCartItems;
  final String ? cartId;
  final CartModel data;
  CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.data,
  });
  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
    status: json["status"],
    numOfCartItems: json["numOfCartItems"],
    cartId: json["cartId"] as String?,
    data: CartModel.fromJson(json["data"]),
  );

  // Map<String, dynamic> toJson() => {
  //   "status": status,
  //   "numOfCartItems": numOfCartItems,
  //   "cartId": cartId,
  //   "data": data.toJson(),
  // };
}