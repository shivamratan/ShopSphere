class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String? brand;
  final String availabilityStatus;
  final List<ReviewModel> reviews;
  final String returnPolicy;
  final List<String> images;
  final String thumbnail;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    this.brand,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.images,
    required this.thumbnail,
  });
}

class ReviewModel {
  final int rating;
  final String comment;
  final String reviewerName;

  const ReviewModel({
    required this.rating,
    required this.comment,
    required this.reviewerName,
  });
}
