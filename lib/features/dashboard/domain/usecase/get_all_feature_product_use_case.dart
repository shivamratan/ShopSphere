
import '../model/product_model.dart';
import '../repo/dashboard_repository.dart';

class GetAllFeatureProductUseCase {
  final DashboardRepository dashboardRepository;

  const GetAllFeatureProductUseCase({required this.dashboardRepository});

  Future<List<ProductModel>> execute() async {
    try {
      final List<ProductModel> products = await dashboardRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      print("Error fetching featured products: $e");
      rethrow;
    }
  }
}