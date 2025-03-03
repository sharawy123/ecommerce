import 'package:equatable/equatable.dart';

import 'cart_item_data.dart';

class Cart extends Equatable{
  final List<CartItemData> items;
  final int totalCartPrice;

  Cart({
    required this.items,
    required this.totalCartPrice,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw[items];
}
