import 'dart:convert';
import 'dart:typed_data';

import 'package:icm_app/domain/entities/vendor_entity.dart';

class VendorDto {
  final int? status;
  final Uint8List? data;
  final String? message;

  VendorDto({this.status, this.data, this.message});
}

extension VendorMapper on VendorDto {
  List<VendorEntity>? toVendor() {
    if (data == null) {
      return null;
    }
    var decode = json.decode(utf8.decode(data!));
    return decode['data']['shops']
        .map<VendorEntity>((vendor) => VendorEntity.fromJson(vendor))
        .toList();
  }
}
