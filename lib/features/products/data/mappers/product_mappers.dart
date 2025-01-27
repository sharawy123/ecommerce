import 'package:ecommerce/features/products/data/models/product_model.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';

extension ProductMapper on ProductModel {

  Product get toEntity =>
      Product(sold: sold,
          images: images,
          ratingsQuantity: ratingsQuantity,
          id: ID,
          title: title,
          description: description,
          quantity: quantity,
          price: price,
          imageCover: imageCover,
          ratingsAverage: ratingsAverage,
          availableColors: availableColors,
          priceAfterDiscount: priceAfterDiscount,
      );
}
