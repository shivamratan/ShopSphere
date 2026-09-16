
import 'package:shopsphere/features/dashboard/domain/model/product_category_model.dart';

abstract class DashboardRepository {

  Future<List<ProductCategoryModel>> getAllProductCategory();
}