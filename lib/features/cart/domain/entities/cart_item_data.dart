import 'package:ecommerce/features/cart/domain/entities/cart_product_data.dart';
import 'package:equatable/equatable.dart';

class CartItemData   {
  final int count;
  final CartProductData product;
  final int price;

   CartItemData({
    required this.count,
    required this.product,
    required this.price,
  });

}
