
import 'package:shopsphere/features/dashboard/domain/model/product_category_model.dart';

class ProductCategory {
  final String category;

  const ProductCategory({required this.category});

  factory ProductCategory.fromJson(dynamic json) {
    return switch(json) {
      String category => ProductCategory(category: category),
      _ => throw FormatException('Invalid JSON type for ProductCategory: ${json.runtimeType}'),
    };
  }

  ProductCategoryModel toProductCategoryModel() {
    return ProductCategoryModel(category: category);
  }

  @override
  String toString() {
    return 'ProductCategory(category: $category)';
  }
}