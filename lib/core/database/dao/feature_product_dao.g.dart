// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_product_dao.dart';

// ignore_for_file: type=lint
mixin _$FeatureProductDaoMixin on DatabaseAccessor<ShopsphereDb> {
  $FeatureProductTableTable get featureProductTable =>
      attachedDatabase.featureProductTable;
  FeatureProductDaoManager get managers => FeatureProductDaoManager(this);
}

class FeatureProductDaoManager {
  final _$FeatureProductDaoMixin _db;
  FeatureProductDaoManager(this._db);
  $$FeatureProductTableTableTableManager get featureProductTable =>
      $$FeatureProductTableTableTableManager(
        _db.attachedDatabase,
        _db.featureProductTable,
      );
}
