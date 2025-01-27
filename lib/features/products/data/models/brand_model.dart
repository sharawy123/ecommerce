
class BrandModel {
final String id;
final String name;
final String slug;
final String? image;

BrandModel({
required this.id,
required this.name,
required this.slug,
this.image,
});

factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
id: json["_id"],
name: json["name"],
slug: json["slug"],
image: json["image"],
);
}

