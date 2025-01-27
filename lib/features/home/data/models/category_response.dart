import '../../../../core/models/category_model.dart';
import '../../../../core/models/meta_data.dart';
class CategoryResponse {
  final int results;
  final Metadata metadata;
  final List<CategoryModel> categories;

  CategoryResponse({
    required this.results,
    required this.metadata,
    required this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    results: json["results"],
    metadata: Metadata.fromJson(json["metadata"]),
    categories: List<CategoryModel>.from(json["data"].map((x) => CategoryModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": results,
    "metadata": metadata.toJson(),
    "data": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}