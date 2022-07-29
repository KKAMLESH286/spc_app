class BannerEntity {
  int? id;
  String? type;
  String? image;
  String? onclick;
  int? isActive;

  BannerEntity({this.id, this.type, this.image, this.onclick, this.isActive});

  BannerEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
    onclick = json['onclick'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['image'] = this.image;
    data['onclick'] = this.onclick;
    data['is_active'] = this.isActive;
    return data;
  }
}
