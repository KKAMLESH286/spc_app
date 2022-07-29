class VendorEntity {
  int? shopid;
  String? shopName;
  String? img;
  String? threshold;
  String? shippingPrice;
  String? openingClosingTime;

  VendorEntity(
      {this.shopid,
      this.shopName,
      this.img,
      this.threshold,
      this.shippingPrice,
      this.openingClosingTime});

  VendorEntity.fromJson(Map<String, dynamic> json) {
    shopid = json['shopid'];
    shopName = json['shop_name'];
    img = json['img'];
    threshold = json['threshold'];
    shippingPrice = json['shipping_price'];
    openingClosingTime = json['opening_closing_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopid'] = this.shopid;
    data['shop_name'] = this.shopName;
    data['img'] = this.img;
    data['threshold'] = this.threshold;
    data['shipping_price'] = this.shippingPrice;
    data['opening_closing_time'] = this.openingClosingTime;
    return data;
  }
}
