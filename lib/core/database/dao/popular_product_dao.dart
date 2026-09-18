import 'package:drift/drift.dart';
import 'package:shopsphere/core/database/db/shopsphere_db.dart';
import 'package:shopsphere/features/dashboard/data/dto/product.dart';

import '../table/popular_product_table.dart';

part 'popular_product_dao.g.dart';

@DriftAccessor(tables: [PopularProductTable])
class PopularProductDao extends DatabaseAccessor<ShopsphereDb> with _$PopularProductDaoMixin {
  PopularProductDao(ShopsphereDb db) : super(db);

  Future<List<Product>> getAllPopularProducts() => select(popularProductTable).get();

  Future<void> savePopularProducts(List<Product> productList) {
    return batch((batch) {
      batch.insertAll(
        popularProductTable,
        productList.map((p) => PopularProductTableCompanion.insert(
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

  Future<void> deleteAllPopularProducts() {
    return delete(popularProductTable).go();
  }
}
