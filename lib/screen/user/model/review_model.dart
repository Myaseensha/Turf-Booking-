class ReviewGet {
  final String id;
  final String review;
  final int rating;
  final String user;

  ReviewGet({
    required this.id,
    required this.review,
    required this.rating,
    required this.user,
  });

  factory ReviewGet.fromJson(Map<String, dynamic> json) => ReviewGet(
        id: json["_id"],
        review: json["review"],
        rating: json["rating"],
        user: json["user"][0]["username"],
      );
}
