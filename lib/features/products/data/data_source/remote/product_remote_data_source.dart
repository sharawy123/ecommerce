import 'package:ecommerce/features/products/data/models/product_response.dart';

abstract class ProductRemoteDataSource {
  Future <ProductResponse> getProducts({String? categoryId});
}