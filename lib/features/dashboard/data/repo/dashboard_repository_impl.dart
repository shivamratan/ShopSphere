
import 'package:shopsphere/core/database/table/product_category_table.dart';
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
    try {
      final response = await dioClient.get(NetworkEndPoint.productCategoryList);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<ProductCategory> productCategoryList = data.map((json) {
          return ProductCategory.fromJson(json);
        }).toList();

        await productCategoryDao.deleteAllCategories();
        await productCategoryDao.saveCategories(productCategoryList);
      } else {
        print("Error fetching product categories: ${response.statusCode}");
      }

      List<ProductCategory> productCategories = await productCategoryDao.getAllCategories();
      return productCategories.map((e) => e.toProductCategoryModel()).toList();

    } catch(e) {
      print("Error fetching product categories");
    }

    List<ProductCategory> productCategories = await productCategoryDao.getAllCategories();
    return productCategories.map((e) => e.toProductCategoryModel()).toList();
  }


}