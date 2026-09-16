
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/core/database/db/shopsphere_db.dart';

import 'dao/product_category_dao.dart';

final databaseProvider = Provider<ShopsphereDb>((ref) => ShopsphereDb());

final productCategoryDaoProvider = Provider<ProductCategoryDao>((ref) {
  return ref.watch(databaseProvider).productCategoryDao;
});