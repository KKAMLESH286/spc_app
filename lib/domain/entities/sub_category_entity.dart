class SubCategoryEntity {
  int? id;
  String? name;
  int? parentCat;
  int? status;

  SubCategoryEntity({this.id, this.name, this.parentCat, this.status});

  SubCategoryEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentCat = json['parent_cat'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent_cat'] = this.parentCat;
    data['status'] = this.status;
    return data;
  }
}
