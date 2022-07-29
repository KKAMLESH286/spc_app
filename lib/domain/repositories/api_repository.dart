import 'package:icm_app/domain/entities/banner_entity.dart';
import 'package:icm_app/domain/entities/category_entity.dart';
import 'package:icm_app/domain/entities/shop_products_entity.dart';
import 'package:icm_app/domain/entities/sub_category_entity.dart';
import 'package:icm_app/domain/entities/vendor_entity.dart';

abstract class ApiRepository {
  Future<List<VendorEntity>> getVendor();

  Future<List<CategoryEntity>> getCategory();

  Future<List<SubCategoryEntity>> getSubCategory(String catId);

  Future<List<ShopProductsEntity>> getShopProducts(
      String shopId, String catId, String subCatId);

  Future<List<BannerEntity>> getShopBanners();
}
