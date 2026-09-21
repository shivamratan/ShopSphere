import '../../../../core/database/dao/product_dao.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/network_info.dart';
import '../../../dashboard/data/dto/product.dart';
import '../../../dashboard/domain/model/product_model.dart';
import '../../domain/repo/product_repository.dart';
import '../dto/product_list_response.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDao productDao;
  final DioClient dioClient;

  ProductRepositoryImpl({required this.productDao, required this.dioClient});

  @override
  Future<List<ProductModel>> getProducts({int limit = 20, int skip = 0}) async {
    try {
      final response = await dioClient.get(
        NetworkEndPoint.productList,
        queryParameters: {'limit': limit, 'skip': skip},
      );

      if (response.statusCode == 200) {
        final productListResponse = ProductListResponse.fromJson(response.data);
        final List<Product> products = productListResponse.products;

        await productDao.insertProducts(products);
      }
    } catch (e) {
      print("Error fetching products: $e");
    }

    final dbProducts = await productDao.getPaginatedProducts(limit, skip);
    return dbProducts.map((e) => e.toProductModel()).toList();
  }
}
