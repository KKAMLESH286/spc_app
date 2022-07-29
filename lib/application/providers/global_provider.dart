import 'package:flutter/material.dart';
import 'package:icm_app/domain/entities/banner_entity.dart';
import 'package:icm_app/domain/entities/category_entity.dart';
import 'package:icm_app/domain/entities/shop_products_entity.dart';
import 'package:icm_app/domain/entities/sub_category_entity.dart';
import 'package:icm_app/domain/entities/vendor_entity.dart';
import 'package:icm_app/domain/repositories/api_repository.dart';
import 'package:provider/provider.dart';

class GlobalProvider extends ChangeNotifier {
  late final ApiRepository _apiRepository;

  GlobalProvider(this._apiRepository);

  bool isLoading = true;

  List<VendorEntity> _vendorList = [];
  List<VendorEntity> get vendorList => _vendorList;

  List<CategoryEntity> _categoryList = [];
  List<CategoryEntity> get categoryList => _categoryList;

  List<SubCategoryEntity> _subCategoryList = [];
  List<SubCategoryEntity> get subCategoryList => _subCategoryList;

  List<ShopProductsEntity> _shopProductsList = [];
  List<ShopProductsEntity> get shopProductsList => _shopProductsList;

  List<BannerEntity> _shopBannerList = [];
  List<BannerEntity> get shopBannerList => _shopBannerList;

  Future<List<VendorEntity>> fetchVendors() async {
    isLoading = true;
    _vendorList = await _apiRepository.getVendor();
    isLoading = false;
    notifyListeners();
    return _vendorList;
  }

  Future<List<CategoryEntity>> fetchCategories() async {
    isLoading = true;
    _categoryList = await _apiRepository.getCategory();
    isLoading = false;
    notifyListeners();
    return _categoryList;
  }

  Future<List<SubCategoryEntity>> fetchSubCategories(String catId) async {
    isLoading = true;
    _subCategoryList = await _apiRepository.getSubCategory(catId);
    isLoading = false;
    notifyListeners();
    return _subCategoryList;
  }

  Future<List<ShopProductsEntity>> fetchShopProducts(
      String shopId, String catId, String subCatId) async {
    isLoading = true;
    _shopProductsList =
        await _apiRepository.getShopProducts(shopId, catId, subCatId);
    isLoading = false;
    notifyListeners();
    return _shopProductsList;
  }

  Future<List<BannerEntity>> fetchShopBanners() async {
    isLoading = true;
    _shopBannerList = await _apiRepository.getShopBanners();
    isLoading = false;
    notifyListeners();
    return _shopBannerList;
  }

  static GlobalProvider of(BuildContext context, {listen = true}) =>
      Provider.of<GlobalProvider>(context, listen: listen);
}
