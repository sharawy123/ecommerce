import 'package:ecommerce/features/products/data/models/product_model.dart';
import '../../../../core/models/meta_data.dart';
class ProductResponse {
  final int results;
  final Metadata metadata;
  final List<ProductModel> products;

  ProductResponse({
    required this.results,
    required this.metadata,
    required this.products,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
    results: json["results"],
    metadata: Metadata.fromJson(json["metadata"]),
    products: List<ProductModel>.from(json["data"].map((x) => ProductModel.fromJson(x))),
  );

}