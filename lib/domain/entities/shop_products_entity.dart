class ShopProductsEntity {
  String? name;
  String? desciption;
  String? qty;
  String? unit;
  String? images;
  int? id;
  int? itemId;
  int? cat;
  int? subcat;
  int? price;
  int? isOutOfStock;
  ShopProductsEntity(
      {this.name,
      this.desciption,
      this.qty,
      this.unit,
      this.images,
      this.id,
      this.itemId,
      this.cat,
      this.subcat,
      this.price,
      this.isOutOfStock});

  ShopProductsEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desciption = json['desciption'];
    qty = json['qty'];
    unit = json['unit'];
    images = json['images'];
    id = json['id'];
    itemId = json['item_id'];
    cat = json['cat'];
    subcat = json['subcat'];
    price = json['price'];
    isOutOfStock = json['is_out_of_stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desciption'] = this.desciption;
    data['qty'] = this.qty;
    data['unit'] = this.unit;
    data['images'] = this.images;
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['cat'] = this.cat;
    data['subcat'] = this.subcat;
    data['price'] = this.price;
    data['is_out_of_stock'] = this.isOutOfStock;
    return data;
  }
}
