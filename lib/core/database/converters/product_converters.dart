import 'dart:convert';
import 'package:drift/drift.dart';
import '../../../features/dashboard/data/dto/product.dart';

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    return List<String>.from(json.decode(fromDb) as List);
  }

  @override
  String toSql(List<String> value) {
    return json.encode(value);
  }
}

class DimensionsConverter extends TypeConverter<Dimensions, String> {
  const DimensionsConverter();

  @override
  Dimensions fromSql(String fromDb) {
    return Dimensions.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Dimensions value) {
    return json.encode({
      'width': value.width,
      'height': value.height,
      'depth': value.depth,
    });
  }
}

class ReviewListConverter extends TypeConverter<List<Review>, String> {
  const ReviewListConverter();

  @override
  List<Review> fromSql(String fromDb) {
    return (json.decode(fromDb) as List)
        .map((e) => Review.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<Review> value) {
    return json.encode(value.map((e) => {
      'rating': e.rating,
      'comment': e.comment,
      'date': e.date,
      'reviewerName': e.reviewerName,
      'reviewerEmail': e.reviewerEmail,
    }).toList());
  }
}

class MetaConverter extends TypeConverter<Meta, String> {
  const MetaConverter();

  @override
  Meta fromSql(String fromDb) {
    return Meta.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Meta value) {
    return json.encode({
      'createdAt': value.createdAt,
      'updatedAt': value.updatedAt,
      'barcode': value.barcode,
      'qrCode': value.qrCode,
    });
  }
}
