
import 'package:shopsphere/features/dashboard/domain/model/product_category_model.dart';
import 'package:shopsphere/features/dashboard/domain/model/product_model.dart';

abstract class DashboardRepository {

  Future<List<ProductCategoryModel>> getAllProductCategory();

  Future<List<ProductModel>> getFeaturedProducts();

  Future<List<ProductModel>> getPopularProducts();
}