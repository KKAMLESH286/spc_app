import 'dart:convert';
import 'dart:typed_data';

import 'package:icm_app/domain/entities/category_entity.dart';

class CategoryDto {
  final int? status;
  final Uint8List? data;
  final String? message;

  CategoryDto({this.status, this.data, this.message});
}

extension CategoryMapper on CategoryDto {
  List<CategoryEntity>? toCategory() {
    if (data == null) {
      return null;
    }
    var decode = json.decode(utf8.decode(data!));
    return decode['data']
        .map<CategoryEntity>((character) => CategoryEntity.fromJson(character))
        .toList();
  }
}
