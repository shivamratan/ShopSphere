import '../../../dashboard/domain/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts({int limit = 20, int skip = 0});
}
