import 'package:drift/drift.dart';
import 'package:shopsphere/features/dashboard/data/dto/product.dart';
import '../converters/product_converters.dart';

@UseRowClass(Product)
class PopularProductTable extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  RealColumn get price => real()();
  RealColumn get discountPercentage => real()();
  RealColumn get rating => real()();
  IntColumn get stock => integer()();
  TextColumn get tags => text().map(const StringListConverter())();
  TextColumn get brand => text().nullable()();
  TextColumn get sku => text()();
  IntColumn get weight => integer()();
  TextColumn get dimensions => text().map(const DimensionsConverter())();
  TextColumn get warrantyInformation => text()();
  TextColumn get shippingInformation => text()();
  TextColumn get availabilityStatus => text()();
  TextColumn get reviews => text().map(const ReviewListConverter())();
  TextColumn get returnPolicy => text()();
  IntColumn get minimumOrderQuantity => integer()();
  TextColumn get meta => text().map(const MetaConverter())();
  TextColumn get images => text().map(const StringListConverter())();
  TextColumn get thumbnail => text()();

  @override
  Set<Column> get primaryKey => {id};
}
