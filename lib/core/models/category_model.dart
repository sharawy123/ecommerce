class CategoryModel {
  final String id;
  final String name;
  final String slug;
  final String image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["_id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    createdAt:json["createdAt"] ==null ? null :  DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] ==null ? null :  DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}