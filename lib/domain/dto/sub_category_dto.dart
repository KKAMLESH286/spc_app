import 'dart:convert';
import 'dart:typed_data';
import 'package:icm_app/domain/entities/sub_category_entity.dart';

class SubCategoryDto {
  final int? status;
  final Uint8List? data;
  final String? message;

  SubCategoryDto({this.status, this.data, this.message});
}

extension SubCategoryMapper on SubCategoryDto {
  List<SubCategoryEntity>? toSubCategory() {
    if (data == null) {
      return null;
    }
    var decode = json.decode(utf8.decode(data!));
    return decode['data']
        .map<SubCategoryEntity>((subCat) => SubCategoryEntity.fromJson(subCat))
        .toList();
  }
}
