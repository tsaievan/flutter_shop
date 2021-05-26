class CategoryListModel {

  List<CategoryModel> list;

  CategoryListModel({this.list});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = List<CategoryModel>();
      json['list'].forEach((v) {
        list.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (list != null) {
      data['list'] = list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryModel {
  // Id
  int id;
  // 名称
  String name;
  // 父分类Id
  int pid;
  // 等级
  String level;
  // 图片
  String image;

  CategoryModel({this.id, this.name, this.pid, this.level, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pid = json['pid'];
    level = json['level'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['pid'] = pid;
    data['level'] = level;
    data['image'] = image;
    return data;
  }
}
