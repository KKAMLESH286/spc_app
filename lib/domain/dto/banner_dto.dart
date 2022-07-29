import 'dart:convert';
import 'dart:typed_data';

import 'package:icm_app/domain/entities/banner_entity.dart';

class BannerDto {
  final int? status;
  final Uint8List? data;
  final String? message;

  BannerDto({this.status, this.data, this.message});
}

extension BannerMapper on BannerDto {
  List<BannerEntity>? toBanner() {
    if (data == null) {
      return null;
    }
    var decode = json.decode(utf8.decode(data!));
    return decode['data']['sliders']['categoryslider']
        .map<BannerEntity>((e) => BannerEntity.fromJson(e))
        .toList();
  }
}
