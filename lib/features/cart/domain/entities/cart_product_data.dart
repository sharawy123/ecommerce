import 'package:equatable/equatable.dart';

class CartProductData extends Equatable {
  final String id;
  final String title;
  final String imageCover;
  final double ratingsAverage;

  CartProductData({
    required this.id,
    required this.title,
    required this.imageCover,
    required this.ratingsAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw [id];

}