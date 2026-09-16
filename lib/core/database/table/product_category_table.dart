
import 'package:drift/drift.dart';

import '../../../features/dashboard/data/dto/product_category.dart';

@UseRowClass(ProductCategory)
class ProductCategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text()();
}