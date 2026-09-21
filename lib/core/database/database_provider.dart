
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/core/database/dao/feature_product_dao.dart';
import 'package:shopsphere/core/database/dao/popular_product_dao.dart';
import 'package:shopsphere/core/database/db/shopsphere_db.dart';

import 'dao/product_category_dao.dart';

final databaseProvider = Provider<ShopsphereDb>((ref) => ShopsphereDb());

final productCategoryDaoProvider = Provider<ProductCategoryDao>((ref) {
  return ref.watch(databaseProvider).productCategoryDao;
});

final featureProductDaoProvider = Provider<FeatureProductDao>((ref) {
  return ref.watch(databaseProvider).featureProductDao;
});

final popularProductDaoProvider = Provider<PopularProductDao>((ref) {
  return ref.watch(databaseProvider).popularProductDao;
});

final productDaoProvider = Provider((ref) {
  return ref.watch(databaseProvider).productDao;
});
