// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_product_dao.dart';

// ignore_for_file: type=lint
mixin _$PopularProductDaoMixin on DatabaseAccessor<ShopsphereDb> {
  $PopularProductTableTable get popularProductTable =>
      attachedDatabase.popularProductTable;
  PopularProductDaoManager get managers => PopularProductDaoManager(this);
}

class PopularProductDaoManager {
  final _$PopularProductDaoMixin _db;
  PopularProductDaoManager(this._db);
  $$PopularProductTableTableTableManager get popularProductTable =>
      $$PopularProductTableTableTableManager(
        _db.attachedDatabase,
        _db.popularProductTable,
      );
}
