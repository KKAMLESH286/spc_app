import 'package:icm_app/domain/dto/banner_dto.dart';
import 'package:icm_app/domain/dto/category_dto.dart';
import 'package:icm_app/domain/dto/shop_products_dto.dart';
import 'package:icm_app/domain/dto/sub_category_dto.dart';
import 'package:icm_app/domain/dto/vendor_dto.dart';
import 'package:icm_app/domain/entities/banner_entity.dart';
import 'package:icm_app/domain/entities/category_entity.dart';
import 'package:icm_app/domain/entities/shop_products_entity.dart';
import 'package:icm_app/domain/entities/sub_category_entity.dart';
import 'package:icm_app/domain/entities/vendor_entity.dart';
import 'package:icm_app/domain/repositories/api_repository.dart';
import 'package:icm_app/infrastructure/services/services.dart';

class ApiRepositoryImpl extends ApiRepository {
  Future<List<VendorEntity>> getVendor() async {
    VendorDto dto = await Services.getVendor();
    if (dto.status == 200) {
      return dto.toVendor() ?? [];
    } else {
      return [];
    }
  }

  Future<List<CategoryEntity>> getCategory() async {
    CategoryDto dto = await Services.getCategories();
    if (dto.status == 200) {
      return dto.toCategory() ?? [];
    } else {
      return [];
    }
  }

  Future<List<SubCategoryEntity>> getSubCategory(String catId) async {
    SubCategoryDto dto = await Services.getSubCategories(catId);
    if (dto.status == 200) {
      return dto.toSubCategory() ?? [];
    } else {
      return [];
    }
  }

  Future<List<ShopProductsEntity>> getShopProducts(
      String shopId, String catId, String subCatId) async {
    ShopProductsDto dto =
        await Services.getShopProducts(shopId, catId, subCatId);
    if (dto.status == 200) {
      return dto.toShopProducts() ?? [];
    } else {
      return [];
    }
  }

  Future<List<BannerEntity>> getShopBanners() async {
    BannerDto dto = await Services.getBanners();
    if (dto.status == 200) {
      return dto.toBanner() ?? [];
    } else {
      return [];
    }
  }
}
