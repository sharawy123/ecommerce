import 'package:ecommerce/features/products/domain/entities/product.dart';

abstract class ProductState {}
class ProductInitial extends ProductState {}
class getProductsLoading extends ProductState {}
class getProductsSuccess extends ProductState {
  final List<Product> products;
  getProductsSuccess (this.products);
}
class getProductsError extends ProductState {
  final String message;
  getProductsError(this.message);
}

class productQuantityChange extends ProductState {}