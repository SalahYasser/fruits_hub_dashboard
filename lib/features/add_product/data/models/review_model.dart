class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String reviewDescription;
  final num rating;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.reviewDescription,
    required this.rating,
  });

  factory ReviewModel.fromEntity(ReviewModel reviewModel) {
    return ReviewModel(
      name: reviewModel.name,
      image: reviewModel.image,
      date: reviewModel.date,
      reviewDescription: reviewModel.reviewDescription,
      rating: reviewModel.rating,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      date: json['date'],
      reviewDescription: json['reviewDescription'],
      rating: json['rating'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'reviewDescription': reviewDescription,
      'rating': rating,
    };
  }
}
