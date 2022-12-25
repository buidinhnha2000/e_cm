// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      idProduct: json['_id'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      img: json['img'] as String,
      amount: json['amount'] as int,
      sold: json['sold'] as int,
      like: json['like'] as int,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      size: (json['size'] as List<dynamic>).map((e) => e as String).toList(),
      color: (json['color'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as int,
      inStock: json['inStock'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      '_id': instance.idProduct,
      'title': instance.title,
      'desc': instance.desc,
      'img': instance.img,
      'amount': instance.amount,
      'sold': instance.sold,
      'like': instance.like,
      'categories': instance.categories,
      'size': instance.size,
      'color': instance.color,
      'price': instance.price,
      'inStock': instance.inStock,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
