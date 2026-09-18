
import 'package:shopsphere/core/database/dao/feature_product_dao.dart';
import 'package:shopsphere/core/database/table/product_category_table.dart';
import 'package:shopsphere/core/network/dio_client.dart';
import 'package:shopsphere/core/network/network_info.dart';
import 'package:shopsphere/features/dashboard/data/dto/product.dart';
import 'package:shopsphere/features/dashboard/data/dto/product_category.dart';
import 'package:shopsphere/features/dashboard/domain/model/product_category_model.dart';
import 'package:shopsphere/features/dashboard/domain/model/product_model.dart';
import 'package:shopsphere/features/dashboard/domain/repo/dashboard_repository.dart';

import '../../../../core/database/dao/popular_product_dao.dart';
import '../../../../core/database/dao/product_category_dao.dart';

class DashboardRepositoryImpl extends DashboardRepository {

  final ProductCategoryDao productCategoryDao;
  final FeatureProductDao featureProductDao;
  final PopularProductDao popularProductDao;

  final DioClient dioClient;

  DashboardRepositoryImpl({required this.featureProductDao, required this.popularProductDao, required this.productCategoryDao, required this.dioClient});

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

  @override
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final response = await dioClient.get(NetworkEndPoint.featureProductList);

      if (response.statusCode == 200) {
        final List<dynamic> productsData = response.data['products'];
        final List<Product> productList = productsData.map((json) {
          return Product.fromJson(json);
        }).toList();

        await featureProductDao.deleteAllFeaturedProducts();
        await featureProductDao.saveFeaturedProducts(productList);
      }
    } catch (e) {
      print("Error fetching featured products: $e");
    }

    final dbProducts = await featureProductDao.getAllFeaturedProducts();
    return dbProducts.map((e) => e.toProductModel()).toList();
  }

  @override
  Future<List<ProductModel>> getPopularProducts() async {
    try {
      final response = await dioClient.get(NetworkEndPoint.popularProductList);

      if (response.statusCode == 200) {
        final List<dynamic> productsData = response.data['products'];
        final List<Product> productList = productsData.map((json) {
          return Product.fromJson(json);
        }).toList();

        await popularProductDao.deleteAllPopularProducts();
        await popularProductDao.savePopularProducts(productList);
      }
    } catch (e) {
      print("Error fetching popular products: $e");
    }

    final dbProducts = await popularProductDao.getAllPopularProducts();
    return dbProducts.map((e) => e.toProductModel()).toList();
  }


}