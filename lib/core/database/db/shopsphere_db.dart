import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:shopsphere/core/database/table/feature_product_table.dart';
import 'package:shopsphere/core/database/table/popular_product_table.dart';
import 'package:shopsphere/core/database/table/product_category_table.dart';
import 'package:shopsphere/core/database/table/product_table.dart';
import 'package:shopsphere/core/database/converters/product_converters.dart';
import 'package:shopsphere/features/dashboard/data/dto/product.dart';
import 'package:shopsphere/features/dashboard/data/dto/product_category.dart';

import '../dao/feature_product_dao.dart';
import '../dao/popular_product_dao.dart';
import '../dao/product_category_dao.dart';
import '../dao/product_dao.dart';

part 'shopsphere_db.g.dart';

@DriftDatabase(tables: [
  ProductCategoryTable,
  FeatureProductTable,
  PopularProductTable,
  ProductTable,
], daos: [
  ProductCategoryDao,
  FeatureProductDao,
  PopularProductDao,
  ProductDao,
])
class ShopsphereDb extends _$ShopsphereDb {

  ShopsphereDb(): super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(featureProductTable);
            await m.createTable(popularProductTable);
          }
          if (from < 3) {
            await m.createTable(productTable);
          }
        },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
