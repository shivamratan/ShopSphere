
import '../model/product_category_model.dart';
import '../repo/dashboard_repository.dart';

class GetAllProductCategoryUseCase {
  final DashboardRepository dashboardRepository;

  GetAllProductCategoryUseCase({required this.dashboardRepository});

  Future<List<ProductCategoryModel>> execute() async {
    return dashboardRepository.getAllProductCategory();
  }

}