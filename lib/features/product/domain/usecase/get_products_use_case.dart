import '../../../dashboard/domain/model/product_model.dart';
import '../repo/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository productRepository;

  GetProductsUseCase({required this.productRepository});

  Future<List<ProductModel>> execute({int limit = 20, int skip = 0}) async {
    return productRepository.getProducts(limit: limit, skip: skip);
  }
}
