import 'package:ecommerce/features/cart/data/models/cart_product_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_product_data.dart';

extension CartProductMapper on CartProductModel {
  CartProductData get toEntity => CartProductData(
      id: id,
      title: title,
      imageCover: imageCover,
      ratingsAverage: ratingsAverage,);
}
