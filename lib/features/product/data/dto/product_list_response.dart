import '../../../dashboard/data/dto/product.dart';

class ProductListResponse {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  ProductListResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      products: (json['products'] as List)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      skip: json['skip'] as int,
      limit: json['limit'] as int,
    );
  }
}
