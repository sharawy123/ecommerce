class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    currentPage: json["currentPage"],
    numberOfPages: json["numberOfPages"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "numberOfPages": numberOfPages,
    "limit": limit,
  };
}
