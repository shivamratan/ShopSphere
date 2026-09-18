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

class $FeatureProductTableTable extends FeatureProductTable
    with TableInfo<$FeatureProductTableTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeatureProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountPercentageMeta =
      const VerificationMeta('discountPercentage');
  @override
  late final GeneratedColumn<double> discountPercentage =
      GeneratedColumn<double>(
        'discount_percentage',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>(
        'tags',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($FeatureProductTableTable.$convertertags);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Dimensions, String> dimensions =
      GeneratedColumn<String>(
        'dimensions',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Dimensions>(
        $FeatureProductTableTable.$converterdimensions,
      );
  static const VerificationMeta _warrantyInformationMeta =
      const VerificationMeta('warrantyInformation');
  @override
  late final GeneratedColumn<String> warrantyInformation =
      GeneratedColumn<String>(
        'warranty_information',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _shippingInformationMeta =
      const VerificationMeta('shippingInformation');
  @override
  late final GeneratedColumn<String> shippingInformation =
      GeneratedColumn<String>(
        'shipping_information',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _availabilityStatusMeta =
      const VerificationMeta('availabilityStatus');
  @override
  late final GeneratedColumn<String> availabilityStatus =
      GeneratedColumn<String>(
        'availability_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  @override
  late final GeneratedColumnWithTypeConverter<List<Review>, String> reviews =
      GeneratedColumn<String>(
        'reviews',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<Review>>(
        $FeatureProductTableTable.$converterreviews,
      );
  static const VerificationMeta _returnPolicyMeta = const VerificationMeta(
    'returnPolicy',
  );
  @override
  late final GeneratedColumn<String> returnPolicy = GeneratedColumn<String>(
    'return_policy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minimumOrderQuantityMeta =
      const VerificationMeta('minimumOrderQuantity');
  @override
  late final GeneratedColumn<int> minimumOrderQuantity = GeneratedColumn<int>(
    'minimum_order_quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Meta, String> meta =
      GeneratedColumn<String>(
        'meta',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Meta>($FeatureProductTableTable.$convertermeta);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> images =
      GeneratedColumn<String>(
        'images',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($FeatureProductTableTable.$converterimages);
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    category,
    price,
    discountPercentage,
    rating,
    stock,
    tags,
    brand,
    sku,
    weight,
    dimensions,
    warrantyInformation,
    shippingInformation,
    availabilityStatus,
    reviews,
    returnPolicy,
    minimumOrderQuantity,
    meta,
    images,
    thumbnail,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feature_product_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount_percentage')) {
      context.handle(
        _discountPercentageMeta,
        discountPercentage.isAcceptableOrUnknown(
          data['discount_percentage']!,
          _discountPercentageMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_discountPercentageMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('warranty_information')) {
      context.handle(
        _warrantyInformationMeta,
        warrantyInformation.isAcceptableOrUnknown(
          data['warranty_information']!,
          _warrantyInformationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warrantyInformationMeta);
    }
    if (data.containsKey('shipping_information')) {
      context.handle(
        _shippingInformationMeta,
        shippingInformation.isAcceptableOrUnknown(
          data['shipping_information']!,
          _shippingInformationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shippingInformationMeta);
    }
    if (data.containsKey('availability_status')) {
      context.handle(
        _availabilityStatusMeta,
        availabilityStatus.isAcceptableOrUnknown(
          data['availability_status']!,
          _availabilityStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_availabilityStatusMeta);
    }
    if (data.containsKey('return_policy')) {
      context.handle(
        _returnPolicyMeta,
        returnPolicy.isAcceptableOrUnknown(
          data['return_policy']!,
          _returnPolicyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_returnPolicyMeta);
    }
    if (data.containsKey('minimum_order_quantity')) {
      context.handle(
        _minimumOrderQuantityMeta,
        minimumOrderQuantity.isAcceptableOrUnknown(
          data['minimum_order_quantity']!,
          _minimumOrderQuantityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minimumOrderQuantityMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      discountPercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_percentage'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
      tags: $FeatureProductTableTable.$convertertags.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tags'],
        )!,
      ),
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weight'],
      )!,
      dimensions: $FeatureProductTableTable.$converterdimensions.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}dimensions'],
        )!,
      ),
      warrantyInformation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warranty_information'],
      )!,
      shippingInformation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shipping_information'],
      )!,
      availabilityStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}availability_status'],
      )!,
      reviews: $FeatureProductTableTable.$converterreviews.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reviews'],
        )!,
      ),
      returnPolicy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}return_policy'],
      )!,
      minimumOrderQuantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minimum_order_quantity'],
      )!,
      meta: $FeatureProductTableTable.$convertermeta.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}meta'],
        )!,
      ),
      images: $FeatureProductTableTable.$converterimages.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}images'],
        )!,
      ),
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      )!,
    );
  }

  @override
  $FeatureProductTableTable createAlias(String alias) {
    return $FeatureProductTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertags =
      const StringListConverter();
  static TypeConverter<Dimensions, String> $converterdimensions =
      const DimensionsConverter();
  static TypeConverter<List<Review>, String> $converterreviews =
      const ReviewListConverter();
  static TypeConverter<Meta, String> $convertermeta = const MetaConverter();
  static TypeConverter<List<String>, String> $converterimages =
      const StringListConverter();
}

class FeatureProductTableCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> category;
  final Value<double> price;
  final Value<double> discountPercentage;
  final Value<double> rating;
  final Value<int> stock;
  final Value<List<String>> tags;
  final Value<String?> brand;
  final Value<String> sku;
  final Value<int> weight;
  final Value<Dimensions> dimensions;
  final Value<String> warrantyInformation;
  final Value<String> shippingInformation;
  final Value<String> availabilityStatus;
  final Value<List<Review>> reviews;
  final Value<String> returnPolicy;
  final Value<int> minimumOrderQuantity;
  final Value<Meta> meta;
  final Value<List<String>> images;
  final Value<String> thumbnail;
  const FeatureProductTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.price = const Value.absent(),
    this.discountPercentage = const Value.absent(),
    this.rating = const Value.absent(),
    this.stock = const Value.absent(),
    this.tags = const Value.absent(),
    this.brand = const Value.absent(),
    this.sku = const Value.absent(),
    this.weight = const Value.absent(),
    this.dimensions = const Value.absent(),
    this.warrantyInformation = const Value.absent(),
    this.shippingInformation = const Value.absent(),
    this.availabilityStatus = const Value.absent(),
    this.reviews = const Value.absent(),
    this.returnPolicy = const Value.absent(),
    this.minimumOrderQuantity = const Value.absent(),
    this.meta = const Value.absent(),
    this.images = const Value.absent(),
    this.thumbnail = const Value.absent(),
  });
  FeatureProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String category,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required List<String> tags,
    this.brand = const Value.absent(),
    required String sku,
    required int weight,
    required Dimensions dimensions,
    required String warrantyInformation,
    required String shippingInformation,
    required String availabilityStatus,
    required List<Review> reviews,
    required String returnPolicy,
    required int minimumOrderQuantity,
    required Meta meta,
    required List<String> images,
    required String thumbnail,
  }) : title = Value(title),
       description = Value(description),
       category = Value(category),
       price = Value(price),
       discountPercentage = Value(discountPercentage),
       rating = Value(rating),
       stock = Value(stock),
       tags = Value(tags),
       sku = Value(sku),
       weight = Value(weight),
       dimensions = Value(dimensions),
       warrantyInformation = Value(warrantyInformation),
       shippingInformation = Value(shippingInformation),
       availabilityStatus = Value(availabilityStatus),
       reviews = Value(reviews),
       returnPolicy = Value(returnPolicy),
       minimumOrderQuantity = Value(minimumOrderQuantity),
       meta = Value(meta),
       images = Value(images),
       thumbnail = Value(thumbnail);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<double>? price,
    Expression<double>? discountPercentage,
    Expression<double>? rating,
    Expression<int>? stock,
    Expression<String>? tags,
    Expression<String>? brand,
    Expression<String>? sku,
    Expression<int>? weight,
    Expression<String>? dimensions,
    Expression<String>? warrantyInformation,
    Expression<String>? shippingInformation,
    Expression<String>? availabilityStatus,
    Expression<String>? reviews,
    Expression<String>? returnPolicy,
    Expression<int>? minimumOrderQuantity,
    Expression<String>? meta,
    Expression<String>? images,
    Expression<String>? thumbnail,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (price != null) 'price': price,
      if (discountPercentage != null) 'discount_percentage': discountPercentage,
      if (rating != null) 'rating': rating,
      if (stock != null) 'stock': stock,
      if (tags != null) 'tags': tags,
      if (brand != null) 'brand': brand,
      if (sku != null) 'sku': sku,
      if (weight != null) 'weight': weight,
      if (dimensions != null) 'dimensions': dimensions,
      if (warrantyInformation != null)
        'warranty_information': warrantyInformation,
      if (shippingInformation != null)
        'shipping_information': shippingInformation,
      if (availabilityStatus != null) 'availability_status': availabilityStatus,
      if (reviews != null) 'reviews': reviews,
      if (returnPolicy != null) 'return_policy': returnPolicy,
      if (minimumOrderQuantity != null)
        'minimum_order_quantity': minimumOrderQuantity,
      if (meta != null) 'meta': meta,
      if (images != null) 'images': images,
      if (thumbnail != null) 'thumbnail': thumbnail,
    });
  }

  FeatureProductTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? category,
    Value<double>? price,
    Value<double>? discountPercentage,
    Value<double>? rating,
    Value<int>? stock,
    Value<List<String>>? tags,
    Value<String?>? brand,
    Value<String>? sku,
    Value<int>? weight,
    Value<Dimensions>? dimensions,
    Value<String>? warrantyInformation,
    Value<String>? shippingInformation,
    Value<String>? availabilityStatus,
    Value<List<Review>>? reviews,
    Value<String>? returnPolicy,
    Value<int>? minimumOrderQuantity,
    Value<Meta>? meta,
    Value<List<String>>? images,
    Value<String>? thumbnail,
  }) {
    return FeatureProductTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      meta: meta ?? this.meta,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] = Variable<double>(discountPercentage.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
        $FeatureProductTableTable.$convertertags.toSql(tags.value),
      );
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (dimensions.present) {
      map['dimensions'] = Variable<String>(
        $FeatureProductTableTable.$converterdimensions.toSql(dimensions.value),
      );
    }
    if (warrantyInformation.present) {
      map['warranty_information'] = Variable<String>(warrantyInformation.value);
    }
    if (shippingInformation.present) {
      map['shipping_information'] = Variable<String>(shippingInformation.value);
    }
    if (availabilityStatus.present) {
      map['availability_status'] = Variable<String>(availabilityStatus.value);
    }
    if (reviews.present) {
      map['reviews'] = Variable<String>(
        $FeatureProductTableTable.$converterreviews.toSql(reviews.value),
      );
    }
    if (returnPolicy.present) {
      map['return_policy'] = Variable<String>(returnPolicy.value);
    }
    if (minimumOrderQuantity.present) {
      map['minimum_order_quantity'] = Variable<int>(minimumOrderQuantity.value);
    }
    if (meta.present) {
      map['meta'] = Variable<String>(
        $FeatureProductTableTable.$convertermeta.toSql(meta.value),
      );
    }
    if (images.present) {
      map['images'] = Variable<String>(
        $FeatureProductTableTable.$converterimages.toSql(images.value),
      );
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeatureProductTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('rating: $rating, ')
          ..write('stock: $stock, ')
          ..write('tags: $tags, ')
          ..write('brand: $brand, ')
          ..write('sku: $sku, ')
          ..write('weight: $weight, ')
          ..write('dimensions: $dimensions, ')
          ..write('warrantyInformation: $warrantyInformation, ')
          ..write('shippingInformation: $shippingInformation, ')
          ..write('availabilityStatus: $availabilityStatus, ')
          ..write('reviews: $reviews, ')
          ..write('returnPolicy: $returnPolicy, ')
          ..write('minimumOrderQuantity: $minimumOrderQuantity, ')
          ..write('meta: $meta, ')
          ..write('images: $images, ')
          ..write('thumbnail: $thumbnail')
          ..write(')'))
        .toString();
  }
}

class $PopularProductTableTable extends PopularProductTable
    with TableInfo<$PopularProductTableTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PopularProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountPercentageMeta =
      const VerificationMeta('discountPercentage');
  @override
  late final GeneratedColumn<double> discountPercentage =
      GeneratedColumn<double>(
        'discount_percentage',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> tags =
      GeneratedColumn<String>(
        'tags',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($PopularProductTableTable.$convertertags);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Dimensions, String> dimensions =
      GeneratedColumn<String>(
        'dimensions',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Dimensions>(
        $PopularProductTableTable.$converterdimensions,
      );
  static const VerificationMeta _warrantyInformationMeta =
      const VerificationMeta('warrantyInformation');
  @override
  late final GeneratedColumn<String> warrantyInformation =
      GeneratedColumn<String>(
        'warranty_information',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _shippingInformationMeta =
      const VerificationMeta('shippingInformation');
  @override
  late final GeneratedColumn<String> shippingInformation =
      GeneratedColumn<String>(
        'shipping_information',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _availabilityStatusMeta =
      const VerificationMeta('availabilityStatus');
  @override
  late final GeneratedColumn<String> availabilityStatus =
      GeneratedColumn<String>(
        'availability_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  @override
  late final GeneratedColumnWithTypeConverter<List<Review>, String> reviews =
      GeneratedColumn<String>(
        'reviews',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<Review>>(
        $PopularProductTableTable.$converterreviews,
      );
  static const VerificationMeta _returnPolicyMeta = const VerificationMeta(
    'returnPolicy',
  );
  @override
  late final GeneratedColumn<String> returnPolicy = GeneratedColumn<String>(
    'return_policy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minimumOrderQuantityMeta =
      const VerificationMeta('minimumOrderQuantity');
  @override
  late final GeneratedColumn<int> minimumOrderQuantity = GeneratedColumn<int>(
    'minimum_order_quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Meta, String> meta =
      GeneratedColumn<String>(
        'meta',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Meta>($PopularProductTableTable.$convertermeta);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> images =
      GeneratedColumn<String>(
        'images',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($PopularProductTableTable.$converterimages);
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    category,
    price,
    discountPercentage,
    rating,
    stock,
    tags,
    brand,
    sku,
    weight,
    dimensions,
    warrantyInformation,
    shippingInformation,
    availabilityStatus,
    reviews,
    returnPolicy,
    minimumOrderQuantity,
    meta,
    images,
    thumbnail,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'popular_product_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount_percentage')) {
      context.handle(
        _discountPercentageMeta,
        discountPercentage.isAcceptableOrUnknown(
          data['discount_percentage']!,
          _discountPercentageMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_discountPercentageMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('warranty_information')) {
      context.handle(
        _warrantyInformationMeta,
        warrantyInformation.isAcceptableOrUnknown(
          data['warranty_information']!,
          _warrantyInformationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warrantyInformationMeta);
    }
    if (data.containsKey('shipping_information')) {
      context.handle(
        _shippingInformationMeta,
        shippingInformation.isAcceptableOrUnknown(
          data['shipping_information']!,
          _shippingInformationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shippingInformationMeta);
    }
    if (data.containsKey('availability_status')) {
      context.handle(
        _availabilityStatusMeta,
        availabilityStatus.isAcceptableOrUnknown(
          data['availability_status']!,
          _availabilityStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_availabilityStatusMeta);
    }
    if (data.containsKey('return_policy')) {
      context.handle(
        _returnPolicyMeta,
        returnPolicy.isAcceptableOrUnknown(
          data['return_policy']!,
          _returnPolicyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_returnPolicyMeta);
    }
    if (data.containsKey('minimum_order_quantity')) {
      context.handle(
        _minimumOrderQuantityMeta,
        minimumOrderQuantity.isAcceptableOrUnknown(
          data['minimum_order_quantity']!,
          _minimumOrderQuantityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minimumOrderQuantityMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      discountPercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_percentage'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
      tags: $PopularProductTableTable.$convertertags.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tags'],
        )!,
      ),
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weight'],
      )!,
      dimensions: $PopularProductTableTable.$converterdimensions.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}dimensions'],
        )!,
      ),
      warrantyInformation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warranty_information'],
      )!,
      shippingInformation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shipping_information'],
      )!,
      availabilityStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}availability_status'],
      )!,
      reviews: $PopularProductTableTable.$converterreviews.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reviews'],
        )!,
      ),
      returnPolicy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}return_policy'],
      )!,
      minimumOrderQuantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minimum_order_quantity'],
      )!,
      meta: $PopularProductTableTable.$convertermeta.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}meta'],
        )!,
      ),
      images: $PopularProductTableTable.$converterimages.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}images'],
        )!,
      ),
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      )!,
    );
  }

  @override
  $PopularProductTableTable createAlias(String alias) {
    return $PopularProductTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertags =
      const StringListConverter();
  static TypeConverter<Dimensions, String> $converterdimensions =
      const DimensionsConverter();
  static TypeConverter<List<Review>, String> $converterreviews =
      const ReviewListConverter();
  static TypeConverter<Meta, String> $convertermeta = const MetaConverter();
  static TypeConverter<List<String>, String> $converterimages =
      const StringListConverter();
}

class PopularProductTableCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> category;
  final Value<double> price;
  final Value<double> discountPercentage;
  final Value<double> rating;
  final Value<int> stock;
  final Value<List<String>> tags;
  final Value<String?> brand;
  final Value<String> sku;
  final Value<int> weight;
  final Value<Dimensions> dimensions;
  final Value<String> warrantyInformation;
  final Value<String> shippingInformation;
  final Value<String> availabilityStatus;
  final Value<List<Review>> reviews;
  final Value<String> returnPolicy;
  final Value<int> minimumOrderQuantity;
  final Value<Meta> meta;
  final Value<List<String>> images;
  final Value<String> thumbnail;
  const PopularProductTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.price = const Value.absent(),
    this.discountPercentage = const Value.absent(),
    this.rating = const Value.absent(),
    this.stock = const Value.absent(),
    this.tags = const Value.absent(),
    this.brand = const Value.absent(),
    this.sku = const Value.absent(),
    this.weight = const Value.absent(),
    this.dimensions = const Value.absent(),
    this.warrantyInformation = const Value.absent(),
    this.shippingInformation = const Value.absent(),
    this.availabilityStatus = const Value.absent(),
    this.reviews = const Value.absent(),
    this.returnPolicy = const Value.absent(),
    this.minimumOrderQuantity = const Value.absent(),
    this.meta = const Value.absent(),
    this.images = const Value.absent(),
    this.thumbnail = const Value.absent(),
  });
  PopularProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String category,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required List<String> tags,
    this.brand = const Value.absent(),
    required String sku,
    required int weight,
    required Dimensions dimensions,
    required String warrantyInformation,
    required String shippingInformation,
    required String availabilityStatus,
    required List<Review> reviews,
    required String returnPolicy,
    required int minimumOrderQuantity,
    required Meta meta,
    required List<String> images,
    required String thumbnail,
  }) : title = Value(title),
       description = Value(description),
       category = Value(category),
       price = Value(price),
       discountPercentage = Value(discountPercentage),
       rating = Value(rating),
       stock = Value(stock),
       tags = Value(tags),
       sku = Value(sku),
       weight = Value(weight),
       dimensions = Value(dimensions),
       warrantyInformation = Value(warrantyInformation),
       shippingInformation = Value(shippingInformation),
       availabilityStatus = Value(availabilityStatus),
       reviews = Value(reviews),
       returnPolicy = Value(returnPolicy),
       minimumOrderQuantity = Value(minimumOrderQuantity),
       meta = Value(meta),
       images = Value(images),
       thumbnail = Value(thumbnail);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<double>? price,
    Expression<double>? discountPercentage,
    Expression<double>? rating,
    Expression<int>? stock,
    Expression<String>? tags,
    Expression<String>? brand,
    Expression<String>? sku,
    Expression<int>? weight,
    Expression<String>? dimensions,
    Expression<String>? warrantyInformation,
    Expression<String>? shippingInformation,
    Expression<String>? availabilityStatus,
    Expression<String>? reviews,
    Expression<String>? returnPolicy,
    Expression<int>? minimumOrderQuantity,
    Expression<String>? meta,
    Expression<String>? images,
    Expression<String>? thumbnail,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (price != null) 'price': price,
      if (discountPercentage != null) 'discount_percentage': discountPercentage,
      if (rating != null) 'rating': rating,
      if (stock != null) 'stock': stock,
      if (tags != null) 'tags': tags,
      if (brand != null) 'brand': brand,
      if (sku != null) 'sku': sku,
      if (weight != null) 'weight': weight,
      if (dimensions != null) 'dimensions': dimensions,
      if (warrantyInformation != null)
        'warranty_information': warrantyInformation,
      if (shippingInformation != null)
        'shipping_information': shippingInformation,
      if (availabilityStatus != null) 'availability_status': availabilityStatus,
      if (reviews != null) 'reviews': reviews,
      if (returnPolicy != null) 'return_policy': returnPolicy,
      if (minimumOrderQuantity != null)
        'minimum_order_quantity': minimumOrderQuantity,
      if (meta != null) 'meta': meta,
      if (images != null) 'images': images,
      if (thumbnail != null) 'thumbnail': thumbnail,
    });
  }

  PopularProductTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? category,
    Value<double>? price,
    Value<double>? discountPercentage,
    Value<double>? rating,
    Value<int>? stock,
    Value<List<String>>? tags,
    Value<String?>? brand,
    Value<String>? sku,
    Value<int>? weight,
    Value<Dimensions>? dimensions,
    Value<String>? warrantyInformation,
    Value<String>? shippingInformation,
    Value<String>? availabilityStatus,
    Value<List<Review>>? reviews,
    Value<String>? returnPolicy,
    Value<int>? minimumOrderQuantity,
    Value<Meta>? meta,
    Value<List<String>>? images,
    Value<String>? thumbnail,
  }) {
    return PopularProductTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      meta: meta ?? this.meta,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] = Variable<double>(discountPercentage.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
        $PopularProductTableTable.$convertertags.toSql(tags.value),
      );
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (dimensions.present) {
      map['dimensions'] = Variable<String>(
        $PopularProductTableTable.$converterdimensions.toSql(dimensions.value),
      );
    }
    if (warrantyInformation.present) {
      map['warranty_information'] = Variable<String>(warrantyInformation.value);
    }
    if (shippingInformation.present) {
      map['shipping_information'] = Variable<String>(shippingInformation.value);
    }
    if (availabilityStatus.present) {
      map['availability_status'] = Variable<String>(availabilityStatus.value);
    }
    if (reviews.present) {
      map['reviews'] = Variable<String>(
        $PopularProductTableTable.$converterreviews.toSql(reviews.value),
      );
    }
    if (returnPolicy.present) {
      map['return_policy'] = Variable<String>(returnPolicy.value);
    }
    if (minimumOrderQuantity.present) {
      map['minimum_order_quantity'] = Variable<int>(minimumOrderQuantity.value);
    }
    if (meta.present) {
      map['meta'] = Variable<String>(
        $PopularProductTableTable.$convertermeta.toSql(meta.value),
      );
    }
    if (images.present) {
      map['images'] = Variable<String>(
        $PopularProductTableTable.$converterimages.toSql(images.value),
      );
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PopularProductTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('rating: $rating, ')
          ..write('stock: $stock, ')
          ..write('tags: $tags, ')
          ..write('brand: $brand, ')
          ..write('sku: $sku, ')
          ..write('weight: $weight, ')
          ..write('dimensions: $dimensions, ')
          ..write('warrantyInformation: $warrantyInformation, ')
          ..write('shippingInformation: $shippingInformation, ')
          ..write('availabilityStatus: $availabilityStatus, ')
          ..write('reviews: $reviews, ')
          ..write('returnPolicy: $returnPolicy, ')
          ..write('minimumOrderQuantity: $minimumOrderQuantity, ')
          ..write('meta: $meta, ')
          ..write('images: $images, ')
          ..write('thumbnail: $thumbnail')
          ..write(')'))
        .toString();
  }
}

abstract class _$ShopsphereDb extends GeneratedDatabase {
  _$ShopsphereDb(QueryExecutor e) : super(e);
  $ShopsphereDbManager get managers => $ShopsphereDbManager(this);
  late final $ProductCategoryTableTable productCategoryTable =
      $ProductCategoryTableTable(this);
  late final $FeatureProductTableTable featureProductTable =
      $FeatureProductTableTable(this);
  late final $PopularProductTableTable popularProductTable =
      $PopularProductTableTable(this);
  late final ProductCategoryDao productCategoryDao = ProductCategoryDao(
    this as ShopsphereDb,
  );
  late final FeatureProductDao featureProductDao = FeatureProductDao(
    this as ShopsphereDb,
  );
  late final PopularProductDao popularProductDao = PopularProductDao(
    this as ShopsphereDb,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    productCategoryTable,
    featureProductTable,
    popularProductTable,
  ];
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
typedef $$FeatureProductTableTableCreateCompanionBuilder =
    FeatureProductTableCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required String category,
      required double price,
      required double discountPercentage,
      required double rating,
      required int stock,
      required List<String> tags,
      Value<String?> brand,
      required String sku,
      required int weight,
      required Dimensions dimensions,
      required String warrantyInformation,
      required String shippingInformation,
      required String availabilityStatus,
      required List<Review> reviews,
      required String returnPolicy,
      required int minimumOrderQuantity,
      required Meta meta,
      required List<String> images,
      required String thumbnail,
    });
typedef $$FeatureProductTableTableUpdateCompanionBuilder =
    FeatureProductTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> category,
      Value<double> price,
      Value<double> discountPercentage,
      Value<double> rating,
      Value<int> stock,
      Value<List<String>> tags,
      Value<String?> brand,
      Value<String> sku,
      Value<int> weight,
      Value<Dimensions> dimensions,
      Value<String> warrantyInformation,
      Value<String> shippingInformation,
      Value<String> availabilityStatus,
      Value<List<Review>> reviews,
      Value<String> returnPolicy,
      Value<int> minimumOrderQuantity,
      Value<Meta> meta,
      Value<List<String>> images,
      Value<String> thumbnail,
    });

class $$FeatureProductTableTableFilterComposer
    extends Composer<_$ShopsphereDb, $FeatureProductTableTable> {
  $$FeatureProductTableTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
        column: $table.tags,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Dimensions, Dimensions, String>
  get dimensions => $composableBuilder(
    column: $table.dimensions,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get warrantyInformation => $composableBuilder(
    column: $table.warrantyInformation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shippingInformation => $composableBuilder(
    column: $table.shippingInformation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get availabilityStatus => $composableBuilder(
    column: $table.availabilityStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<Review>, List<Review>, String>
  get reviews => $composableBuilder(
    column: $table.reviews,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get returnPolicy => $composableBuilder(
    column: $table.returnPolicy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minimumOrderQuantity => $composableBuilder(
    column: $table.minimumOrderQuantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Meta, Meta, String> get meta =>
      $composableBuilder(
        column: $table.meta,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get images => $composableBuilder(
    column: $table.images,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FeatureProductTableTableOrderingComposer
    extends Composer<_$ShopsphereDb, $FeatureProductTableTable> {
  $$FeatureProductTableTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dimensions => $composableBuilder(
    column: $table.dimensions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warrantyInformation => $composableBuilder(
    column: $table.warrantyInformation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shippingInformation => $composableBuilder(
    column: $table.shippingInformation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get availabilityStatus => $composableBuilder(
    column: $table.availabilityStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reviews => $composableBuilder(
    column: $table.reviews,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get returnPolicy => $composableBuilder(
    column: $table.returnPolicy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minimumOrderQuantity => $composableBuilder(
    column: $table.minimumOrderQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meta => $composableBuilder(
    column: $table.meta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get images => $composableBuilder(
    column: $table.images,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FeatureProductTableTableAnnotationComposer
    extends Composer<_$ShopsphereDb, $FeatureProductTableTable> {
  $$FeatureProductTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<int> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Dimensions, String> get dimensions =>
      $composableBuilder(
        column: $table.dimensions,
        builder: (column) => column,
      );

  GeneratedColumn<String> get warrantyInformation => $composableBuilder(
    column: $table.warrantyInformation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shippingInformation => $composableBuilder(
    column: $table.shippingInformation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get availabilityStatus => $composableBuilder(
    column: $table.availabilityStatus,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<Review>, String> get reviews =>
      $composableBuilder(column: $table.reviews, builder: (column) => column);

  GeneratedColumn<String> get returnPolicy => $composableBuilder(
    column: $table.returnPolicy,
    builder: (column) => column,
  );

  GeneratedColumn<int> get minimumOrderQuantity => $composableBuilder(
    column: $table.minimumOrderQuantity,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Meta, String> get meta =>
      $composableBuilder(column: $table.meta, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get images =>
      $composableBuilder(column: $table.images, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);
}

class $$FeatureProductTableTableTableManager
    extends
        RootTableManager<
          _$ShopsphereDb,
          $FeatureProductTableTable,
          Product,
          $$FeatureProductTableTableFilterComposer,
          $$FeatureProductTableTableOrderingComposer,
          $$FeatureProductTableTableAnnotationComposer,
          $$FeatureProductTableTableCreateCompanionBuilder,
          $$FeatureProductTableTableUpdateCompanionBuilder,
          (
            Product,
            BaseReferences<_$ShopsphereDb, $FeatureProductTableTable, Product>,
          ),
          Product,
          PrefetchHooks Function()
        > {
  $$FeatureProductTableTableTableManager(
    _$ShopsphereDb db,
    $FeatureProductTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeatureProductTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeatureProductTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FeatureProductTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double> discountPercentage = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<List<String>> tags = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String> sku = const Value.absent(),
                Value<int> weight = const Value.absent(),
                Value<Dimensions> dimensions = const Value.absent(),
                Value<String> warrantyInformation = const Value.absent(),
                Value<String> shippingInformation = const Value.absent(),
                Value<String> availabilityStatus = const Value.absent(),
                Value<List<Review>> reviews = const Value.absent(),
                Value<String> returnPolicy = const Value.absent(),
                Value<int> minimumOrderQuantity = const Value.absent(),
                Value<Meta> meta = const Value.absent(),
                Value<List<String>> images = const Value.absent(),
                Value<String> thumbnail = const Value.absent(),
              }) => FeatureProductTableCompanion(
                id: id,
                title: title,
                description: description,
                category: category,
                price: price,
                discountPercentage: discountPercentage,
                rating: rating,
                stock: stock,
                tags: tags,
                brand: brand,
                sku: sku,
                weight: weight,
                dimensions: dimensions,
                warrantyInformation: warrantyInformation,
                shippingInformation: shippingInformation,
                availabilityStatus: availabilityStatus,
                reviews: reviews,
                returnPolicy: returnPolicy,
                minimumOrderQuantity: minimumOrderQuantity,
                meta: meta,
                images: images,
                thumbnail: thumbnail,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required String category,
                required double price,
                required double discountPercentage,
                required double rating,
                required int stock,
                required List<String> tags,
                Value<String?> brand = const Value.absent(),
                required String sku,
                required int weight,
                required Dimensions dimensions,
                required String warrantyInformation,
                required String shippingInformation,
                required String availabilityStatus,
                required List<Review> reviews,
                required String returnPolicy,
                required int minimumOrderQuantity,
                required Meta meta,
                required List<String> images,
                required String thumbnail,
              }) => FeatureProductTableCompanion.insert(
                id: id,
                title: title,
                description: description,
                category: category,
                price: price,
                discountPercentage: discountPercentage,
                rating: rating,
                stock: stock,
                tags: tags,
                brand: brand,
                sku: sku,
                weight: weight,
                dimensions: dimensions,
                warrantyInformation: warrantyInformation,
                shippingInformation: shippingInformation,
                availabilityStatus: availabilityStatus,
                reviews: reviews,
                returnPolicy: returnPolicy,
                minimumOrderQuantity: minimumOrderQuantity,
                meta: meta,
                images: images,
                thumbnail: thumbnail,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FeatureProductTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ShopsphereDb,
      $FeatureProductTableTable,
      Product,
      $$FeatureProductTableTableFilterComposer,
      $$FeatureProductTableTableOrderingComposer,
      $$FeatureProductTableTableAnnotationComposer,
      $$FeatureProductTableTableCreateCompanionBuilder,
      $$FeatureProductTableTableUpdateCompanionBuilder,
      (
        Product,
        BaseReferences<_$ShopsphereDb, $FeatureProductTableTable, Product>,
      ),
      Product,
      PrefetchHooks Function()
    >;
typedef $$PopularProductTableTableCreateCompanionBuilder =
    PopularProductTableCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required String category,
      required double price,
      required double discountPercentage,
      required double rating,
      required int stock,
      required List<String> tags,
      Value<String?> brand,
      required String sku,
      required int weight,
      required Dimensions dimensions,
      required String warrantyInformation,
      required String shippingInformation,
      required String availabilityStatus,
      required List<Review> reviews,
      required String returnPolicy,
      required int minimumOrderQuantity,
      required Meta meta,
      required List<String> images,
      required String thumbnail,
    });
typedef $$PopularProductTableTableUpdateCompanionBuilder =
    PopularProductTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> category,
      Value<double> price,
      Value<double> discountPercentage,
      Value<double> rating,
      Value<int> stock,
      Value<List<String>> tags,
      Value<String?> brand,
      Value<String> sku,
      Value<int> weight,
      Value<Dimensions> dimensions,
      Value<String> warrantyInformation,
      Value<String> shippingInformation,
      Value<String> availabilityStatus,
      Value<List<Review>> reviews,
      Value<String> returnPolicy,
      Value<int> minimumOrderQuantity,
      Value<Meta> meta,
      Value<List<String>> images,
      Value<String> thumbnail,
    });

class $$PopularProductTableTableFilterComposer
    extends Composer<_$ShopsphereDb, $PopularProductTableTable> {
  $$PopularProductTableTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get tags =>
      $composableBuilder(
        column: $table.tags,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Dimensions, Dimensions, String>
  get dimensions => $composableBuilder(
    column: $table.dimensions,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get warrantyInformation => $composableBuilder(
    column: $table.warrantyInformation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shippingInformation => $composableBuilder(
    column: $table.shippingInformation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get availabilityStatus => $composableBuilder(
    column: $table.availabilityStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<Review>, List<Review>, String>
  get reviews => $composableBuilder(
    column: $table.reviews,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get returnPolicy => $composableBuilder(
    column: $table.returnPolicy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minimumOrderQuantity => $composableBuilder(
    column: $table.minimumOrderQuantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Meta, Meta, String> get meta =>
      $composableBuilder(
        column: $table.meta,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get images => $composableBuilder(
    column: $table.images,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PopularProductTableTableOrderingComposer
    extends Composer<_$ShopsphereDb, $PopularProductTableTable> {
  $$PopularProductTableTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dimensions => $composableBuilder(
    column: $table.dimensions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warrantyInformation => $composableBuilder(
    column: $table.warrantyInformation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shippingInformation => $composableBuilder(
    column: $table.shippingInformation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get availabilityStatus => $composableBuilder(
    column: $table.availabilityStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reviews => $composableBuilder(
    column: $table.reviews,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get returnPolicy => $composableBuilder(
    column: $table.returnPolicy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minimumOrderQuantity => $composableBuilder(
    column: $table.minimumOrderQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meta => $composableBuilder(
    column: $table.meta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get images => $composableBuilder(
    column: $table.images,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PopularProductTableTableAnnotationComposer
    extends Composer<_$ShopsphereDb, $PopularProductTableTable> {
  $$PopularProductTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get discountPercentage => $composableBuilder(
    column: $table.discountPercentage,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<int> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Dimensions, String> get dimensions =>
      $composableBuilder(
        column: $table.dimensions,
        builder: (column) => column,
      );

  GeneratedColumn<String> get warrantyInformation => $composableBuilder(
    column: $table.warrantyInformation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shippingInformation => $composableBuilder(
    column: $table.shippingInformation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get availabilityStatus => $composableBuilder(
    column: $table.availabilityStatus,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<Review>, String> get reviews =>
      $composableBuilder(column: $table.reviews, builder: (column) => column);

  GeneratedColumn<String> get returnPolicy => $composableBuilder(
    column: $table.returnPolicy,
    builder: (column) => column,
  );

  GeneratedColumn<int> get minimumOrderQuantity => $composableBuilder(
    column: $table.minimumOrderQuantity,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Meta, String> get meta =>
      $composableBuilder(column: $table.meta, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get images =>
      $composableBuilder(column: $table.images, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);
}

class $$PopularProductTableTableTableManager
    extends
        RootTableManager<
          _$ShopsphereDb,
          $PopularProductTableTable,
          Product,
          $$PopularProductTableTableFilterComposer,
          $$PopularProductTableTableOrderingComposer,
          $$PopularProductTableTableAnnotationComposer,
          $$PopularProductTableTableCreateCompanionBuilder,
          $$PopularProductTableTableUpdateCompanionBuilder,
          (
            Product,
            BaseReferences<_$ShopsphereDb, $PopularProductTableTable, Product>,
          ),
          Product,
          PrefetchHooks Function()
        > {
  $$PopularProductTableTableTableManager(
    _$ShopsphereDb db,
    $PopularProductTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PopularProductTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PopularProductTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PopularProductTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double> discountPercentage = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<List<String>> tags = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String> sku = const Value.absent(),
                Value<int> weight = const Value.absent(),
                Value<Dimensions> dimensions = const Value.absent(),
                Value<String> warrantyInformation = const Value.absent(),
                Value<String> shippingInformation = const Value.absent(),
                Value<String> availabilityStatus = const Value.absent(),
                Value<List<Review>> reviews = const Value.absent(),
                Value<String> returnPolicy = const Value.absent(),
                Value<int> minimumOrderQuantity = const Value.absent(),
                Value<Meta> meta = const Value.absent(),
                Value<List<String>> images = const Value.absent(),
                Value<String> thumbnail = const Value.absent(),
              }) => PopularProductTableCompanion(
                id: id,
                title: title,
                description: description,
                category: category,
                price: price,
                discountPercentage: discountPercentage,
                rating: rating,
                stock: stock,
                tags: tags,
                brand: brand,
                sku: sku,
                weight: weight,
                dimensions: dimensions,
                warrantyInformation: warrantyInformation,
                shippingInformation: shippingInformation,
                availabilityStatus: availabilityStatus,
                reviews: reviews,
                returnPolicy: returnPolicy,
                minimumOrderQuantity: minimumOrderQuantity,
                meta: meta,
                images: images,
                thumbnail: thumbnail,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required String category,
                required double price,
                required double discountPercentage,
                required double rating,
                required int stock,
                required List<String> tags,
                Value<String?> brand = const Value.absent(),
                required String sku,
                required int weight,
                required Dimensions dimensions,
                required String warrantyInformation,
                required String shippingInformation,
                required String availabilityStatus,
                required List<Review> reviews,
                required String returnPolicy,
                required int minimumOrderQuantity,
                required Meta meta,
                required List<String> images,
                required String thumbnail,
              }) => PopularProductTableCompanion.insert(
                id: id,
                title: title,
                description: description,
                category: category,
                price: price,
                discountPercentage: discountPercentage,
                rating: rating,
                stock: stock,
                tags: tags,
                brand: brand,
                sku: sku,
                weight: weight,
                dimensions: dimensions,
                warrantyInformation: warrantyInformation,
                shippingInformation: shippingInformation,
                availabilityStatus: availabilityStatus,
                reviews: reviews,
                returnPolicy: returnPolicy,
                minimumOrderQuantity: minimumOrderQuantity,
                meta: meta,
                images: images,
                thumbnail: thumbnail,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PopularProductTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ShopsphereDb,
      $PopularProductTableTable,
      Product,
      $$PopularProductTableTableFilterComposer,
      $$PopularProductTableTableOrderingComposer,
      $$PopularProductTableTableAnnotationComposer,
      $$PopularProductTableTableCreateCompanionBuilder,
      $$PopularProductTableTableUpdateCompanionBuilder,
      (
        Product,
        BaseReferences<_$ShopsphereDb, $PopularProductTableTable, Product>,
      ),
      Product,
      PrefetchHooks Function()
    >;

class $ShopsphereDbManager {
  final _$ShopsphereDb _db;
  $ShopsphereDbManager(this._db);
  $$ProductCategoryTableTableTableManager get productCategoryTable =>
      $$ProductCategoryTableTableTableManager(_db, _db.productCategoryTable);
  $$FeatureProductTableTableTableManager get featureProductTable =>
      $$FeatureProductTableTableTableManager(_db, _db.featureProductTable);
  $$PopularProductTableTableTableManager get popularProductTable =>
      $$PopularProductTableTableTableManager(_db, _db.popularProductTable);
}
