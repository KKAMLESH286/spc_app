import 'dart:convert';
import 'dart:typed_data';
import 'package:icm_app/domain/entities/shop_products_entity.dart';

class ShopProductsDto {
  final int? status;
  final Uint8List? data;
  final String? message;

  ShopProductsDto({this.status, this.data, this.message});
}

extension ShopProductsMapper on ShopProductsDto {
  List<ShopProductsEntity>? toShopProducts() {
    if (data == null) {
      return null;
    }
    var decode = json.decode(utf8.decode(data!));
    return decode['data']['shopProducts']
        .map<ShopProductsEntity>(
            (shopProducts) => ShopProductsEntity.fromJson(shopProducts))
        .toList();
  }
}
