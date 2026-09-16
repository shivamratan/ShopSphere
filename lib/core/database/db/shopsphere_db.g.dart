// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopsphere_db.dart';

// ignore_for_file: type=lint
class $ProductCategoryTableTable extends ProductCategoryTable
    with TableInfo<$ProductCategoryTableTable, ProductCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductCategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_category_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductCategory(
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
    );
  }

  @override
  $ProductCategoryTableTable createAlias(String alias) {
    return $ProductCategoryTableTable(attachedDatabase, alias);
  }
}

class ProductCategoryTableCompanion extends UpdateCompanion<ProductCategory> {
  final Value<int> id;
  final Value<String> category;
  const ProductCategoryTableCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
  });
  ProductCategoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String category,
  }) : category = Value(category);
  static Insertable<ProductCategory> custom({
    Expression<int>? id,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
    });
  }

  ProductCategoryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? category,
  }) {
    return ProductCategoryTableCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

abstract class _$ShopsphereDb extends GeneratedDatabase {
  _$ShopsphereDb(QueryExecutor e) : super(e);
  $ShopsphereDbManager get managers => $ShopsphereDbManager(this);
  late final $ProductCategoryTableTable productCategoryTable =
      $ProductCategoryTableTable(this);
  late final ProductCategoryDao productCategoryDao = ProductCategoryDao(
    this as ShopsphereDb,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productCategoryTable];
}

typedef $$ProductCategoryTableTableCreateCompanionBuilder =
    ProductCategoryTableCompanion Function({
      Value<int> id,
      required String category,
    });
typedef $$ProductCategoryTableTableUpdateCompanionBuilder =
    ProductCategoryTableCompanion Function({
      Value<int> id,
      Value<String> category,
    });

class $$ProductCategoryTableTableFilterComposer
    extends Composer<_$ShopsphereDb, $ProductCategoryTableTable> {
  $$ProductCategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductCategoryTableTableOrderingComposer
    extends Composer<_$ShopsphereDb, $ProductCategoryTableTable> {
  $$ProductCategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductCategoryTableTableAnnotationComposer
    extends Composer<_$ShopsphereDb, $ProductCategoryTableTable> {
  $$ProductCategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);
}

class $$ProductCategoryTableTableTableManager
    extends
        RootTableManager<
          _$ShopsphereDb,
          $ProductCategoryTableTable,
          ProductCategory,
          $$ProductCategoryTableTableFilterComposer,
          $$ProductCategoryTableTableOrderingComposer,
          $$ProductCategoryTableTableAnnotationComposer,
          $$ProductCategoryTableTableCreateCompanionBuilder,
          $$ProductCategoryTableTableUpdateCompanionBuilder,
          (
            ProductCategory,
            BaseReferences<
              _$ShopsphereDb,
              $ProductCategoryTableTable,
              ProductCategory
            >,
          ),
          ProductCategory,
          PrefetchHooks Function()
        > {
  $$ProductCategoryTableTableTableManager(
    _$ShopsphereDb db,
    $ProductCategoryTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductCategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductCategoryTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProductCategoryTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> category = const Value.absent(),
              }) => ProductCategoryTableCompanion(id: id, category: category),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String category,
              }) => ProductCategoryTableCompanion.insert(
                id: id,
                category: category,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductCategoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ShopsphereDb,
      $ProductCategoryTableTable,
      ProductCategory,
      $$ProductCategoryTableTableFilterComposer,
      $$ProductCategoryTableTableOrderingComposer,
      $$ProductCategoryTableTableAnnotationComposer,
      $$ProductCategoryTableTableCreateCompanionBuilder,
      $$ProductCategoryTableTableUpdateCompanionBuilder,
      (
        ProductCategory,
        BaseReferences<
          _$ShopsphereDb,
          $ProductCategoryTableTable,
          ProductCategory
        >,
      ),
      ProductCategory,
      PrefetchHooks Function()
    >;

class $ShopsphereDbManager {
  final _$ShopsphereDb _db;
  $ShopsphereDbManager(this._db);
  $$ProductCategoryTableTableTableManager get productCategoryTable =>
      $$ProductCategoryTableTableTableManager(_db, _db.productCategoryTable);
}
