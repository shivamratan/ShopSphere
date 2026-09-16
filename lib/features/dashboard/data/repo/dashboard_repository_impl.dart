
import 'package:shopsphere/core/network/dio_client.dart';
import 'package:shopsphere/core/network/network_info.dart';
import 'package:shopsphere/features/dashboard/data/dto/product_category.dart';
import 'package:shopsphere/features/dashboard/domain/model/product_category_model.dart';
import 'package:shopsphere/features/dashboard/domain/repo/dashboard_repository.dart';

import '../../../../core/database/dao/product_category_dao.dart';

class DashboardRepositoryImpl extends DashboardRepository {

  final ProductCategoryDao productCategoryDao;
  final DioClient dioClient;

  DashboardRepositoryImpl({required this.productCategoryDao, required this.dioClient});

  @override
  Future<List<ProductCategoryModel>> getAllProductCategory() async {
    final response = await dioClient.get(NetworkEndPoint.productCategoryList);
    final List<dynamic> data = response.data;
    final List<ProductCategoryModel> productCategoryList = data.map((json) {
        return ProductCategory.fromJson(json).toProductCategoryModel();
    }).toList();

    return productCategoryList;
  }


}