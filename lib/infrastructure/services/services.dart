import 'dart:convert';

import 'package:icm_app/Utils/logs.dart';
import 'package:icm_app/domain/dto/banner_dto.dart';
import 'package:icm_app/domain/dto/category_dto.dart';
import 'package:icm_app/domain/dto/shop_products_dto.dart';
import 'package:icm_app/domain/dto/sub_category_dto.dart';
import 'package:icm_app/domain/dto/vendor_dto.dart';

class Services {
  static const String baseUrl = "https://haryanagame.com";

  static Future<VendorDto> getVendor() async {
    final uri =
        Uri.parse("$baseUrl/groceryapp/shops/list/Kurukshetra/university");

    final response = await httpGet(
      uri,
      headers: {
        'Content-Type': 'application/vnd.api+json',
        'Accept': 'application/vnd.api+json',
      },
    );
    if (response.statusCode == 200) {
      return VendorDto(
          message: 'Categories fetched successfully',
          status: 200,
          data: response.bodyBytes);
    } else {
      dynamic resBody = json.decode(response.body);
      return VendorDto(
          message: resBody['errors'][0]['detail'], status: response.statusCode);
    }
  }

  static Future<CategoryDto> getCategories() async {
    final uri = Uri.parse("$baseUrl/groceryapp/general/categories");

    final response = await httpGet(
      uri,
      headers: {
        'Content-Type': 'application/vnd.api+json',
        'Accept': 'application/vnd.api+json',
      },
    );
    if (response.statusCode == 200) {
      return CategoryDto(
          message: 'Categories fetched successfully',
          status: 200,
          data: response.bodyBytes);
    } else {
      dynamic resBody = json.decode(response.body);
      return CategoryDto(
          message: resBody['errors'][0]['detail'], status: response.statusCode);
    }
  }

  static Future<SubCategoryDto> getSubCategories(String catId) async {
    final uri = Uri.parse("$baseUrl/groceryapp/general/subcategories/$catId");

    final response = await httpGet(
      uri,
      headers: {
        'Content-Type': 'application/vnd.api+json',
        'Accept': 'application/vnd.api+json',
      },
    );
    if (response.statusCode == 200) {
      return SubCategoryDto(
          message: 'Subcategories fetched successfully',
          status: 200,
          data: response.bodyBytes);
    } else {
      dynamic resBody = json.decode(response.body);
      return SubCategoryDto(
          message: resBody['errors'][0]['detail'], status: response.statusCode);
    }
  }

  static Future<ShopProductsDto> getShopProducts(
      String shopId, String catId, String subCatId) async {
    final uri = Uri.parse(
        "$baseUrl/groceryapp/shops/shopProducts/$shopId/$catId/$subCatId");

    final response = await httpGet(
      uri,
      headers: {
        'Content-Type': 'application/vnd.api+json',
        'Accept': 'application/vnd.api+json',
      },
    );
    if (response.statusCode == 200) {
      return ShopProductsDto(
          message: 'Subcategories fetched successfully',
          status: 200,
          data: response.bodyBytes);
    } else {
      dynamic resBody = json.decode(response.body);
      return ShopProductsDto(
          message: resBody['errors'][0]['detail'], status: response.statusCode);
    }
  }

  static Future<BannerDto> getBanners() async {
    final uri = Uri.parse("$baseUrl/groceryapp/shops/slider/categoryslider");

    final response = await httpGet(
      uri,
      headers: {
        'Content-Type': 'application/vnd.api+json',
        'Accept': 'application/vnd.api+json',
      },
    );
    if (response.statusCode == 200) {
      return BannerDto(
          message: 'Banners fetched successfully',
          status: 200,
          data: response.bodyBytes);
    } else {
      dynamic resBody = json.decode(response.body);
      return BannerDto(
          message: resBody['errors'][0]['detail'], status: response.statusCode);
    }
  }
}
