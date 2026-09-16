
import 'package:drift/drift.dart';
import 'package:shopsphere/core/database/db/shopsphere_db.dart';
import 'package:shopsphere/features/dashboard/data/dto/product_category.dart';

import '../table/product_category_table.dart';

part 'product_category_dao.g.dart';

@DriftAccessor(tables: [ProductCategoryTable])
class ProductCategoryDao extends DatabaseAccessor<ShopsphereDb> with _$ProductCategoryDaoMixin {
  ProductCategoryDao(ShopsphereDb db) : super(db);

  // The return type should be the generated Data class (ProductCategoryData)
  // and the table getter name is typically the table class name in camelCase (productCategory)
  Future<List<ProductCategory>> getAllCategories() => select(productCategoryTable).get();


  Future<void> saveCategories(List<ProductCategory> categoryList) {
    return batch((batch) {
      batch.insertAll(
          productCategoryTable,
          categoryList.map((a) => ProductCategoryTableCompanion.insert(
            category: a.category
          )).toList(),
        mode: InsertMode.insertOrReplace
      );
    });
  }

  Future<void> deleteAllCategories() {
    return delete(productCategoryTable).go();
  }

}