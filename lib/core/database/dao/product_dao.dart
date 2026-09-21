import 'package:drift/drift.dart';
import '../db/shopsphere_db.dart';
import '../../../features/dashboard/data/dto/product.dart';
import '../table/product_table.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [ProductTable])
class ProductDao extends DatabaseAccessor<ShopsphereDb> with _$ProductDaoMixin {
  ProductDao(super.db);

  Future<List<Product>> getPaginatedProducts(int limit, int skip) {
    return (select(productTable)..limit(limit, offset: skip)).get();
  }

  Future<void> insertProducts(List<Product> products) {
    return batch((batch) {
      batch.insertAll(
        productTable,
        products.map((p) => ProductTableCompanion.insert(
          id: Value(p.id),
          title: p.title,
          description: p.description,
          category: p.category,
          price: p.price,
          discountPercentage: p.discountPercentage,
          rating: p.rating,
          stock: p.stock,
          tags: p.tags,
          brand: Value(p.brand),
          sku: p.sku,
          weight: p.weight,
          dimensions: p.dimensions,
          warrantyInformation: p.warrantyInformation,
          shippingInformation: p.shippingInformation,
          availabilityStatus: p.availabilityStatus,
          reviews: p.reviews,
          returnPolicy: p.returnPolicy,
          minimumOrderQuantity: p.minimumOrderQuantity,
          meta: p.meta,
          images: p.images,
          thumbnail: p.thumbnail,
        )).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<void> clearAllProducts() {
    return delete(productTable).go();
  }
}
