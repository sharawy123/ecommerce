import 'package:ecommerce/features/cart/data/mappers/cart_item_mappers.dart';
import 'package:ecommerce/features/cart/data/models/cart_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';

extension CartMappers on CartModel {
  Cart get toEntity => Cart(
      items: items.map((item) => item.toEntity).toList(),
      totalCartPrice: totalCartPrice,);
}
