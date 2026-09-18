import 'package:shopsphere/features/dashboard/domain/model/product_model.dart';

class Product {
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
  final String sku;
  final int weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  const Product({
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
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'] as int,
      tags: List<String>.from(json['tags'] as List),
      brand: json['brand'] as String?,
      sku: json['sku'] as String,
      weight: json['weight'] as int,
      dimensions: Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
      warrantyInformation: json['warrantyInformation'] as String,
      shippingInformation: json['shippingInformation'] as String,
      availabilityStatus: json['availabilityStatus'] as String,
      reviews: (json['reviews'] as List)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      returnPolicy: json['returnPolicy'] as String,
      minimumOrderQuantity: json['minimumOrderQuantity'] as int,
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      images: List<String>.from(json['images'] as List),
      thumbnail: json['thumbnail'] as String,
    );
  }

  ProductModel toProductModel() {
    return ProductModel(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      tags: tags,
      brand: brand,
      availabilityStatus: availabilityStatus,
      reviews: reviews.map((e) => e.toReviewModel()).toList(),
      returnPolicy: returnPolicy,
      images: images,
      thumbnail: thumbnail,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, title: $title)';
  }
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  const Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
    );
  }
}

class Review {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  const Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  ReviewModel toReviewModel() {
    return ReviewModel(
      rating: rating,
      comment: comment,
      reviewerName: reviewerName,
    );
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'] as int,
      comment: json['comment'] as String,
      date: json['date'] as String,
      reviewerName: json['reviewerName'] as String,
      reviewerEmail: json['reviewerEmail'] as String,
    );
  }
}

class Meta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  const Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      barcode: json['barcode'] as String,
      qrCode: json['qrCode'] as String,
    );
  }
}
