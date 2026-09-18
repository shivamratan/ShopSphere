
import '../model/product_model.dart';
import '../repo/dashboard_repository.dart';

class GetAllPopularProductUseCase {
  final DashboardRepository dashboardRepository;

  const GetAllPopularProductUseCase({required this.dashboardRepository});

  Future<List<ProductModel>> execute() async {
    try {
      final List<ProductModel> products = await dashboardRepository.getPopularProducts();
      return products;
    } catch (e) {
      print("Error fetching popular products: $e");
      rethrow;
    }
  }

}