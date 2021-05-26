class CategoryGoodListModel {

  List<CategoryGoodModel> list;

  CategoryGoodListModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = List<CategoryGoodModel>();
      json['list'].forEach((v) {
        list.add(CategoryGoodModel.fromJson(v));
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

class CategoryGoodModel {
  int id;

  int category_first;

  int category_second;

  String name;

  int price;

  int discount_price;

  int count;

  int good_sn;

  String images;

  String detail;

  int freight;

  CategoryGoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category_first = json['category_first'];
    category_second = json['category_second'];
    name = json['name'];
    price = json['price'];
    discount_price = json['discount_price'];
    count = json['count'];
    good_sn = json['good_sn'];
    images = json['images'];
    detail = json['detail'];
    freight = json['freight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['category_first'] = category_first;
    data['category_second'] = category_second;
    data['name'] = name;
    data['price'] = price;
    data['discount_price'] = discount_price;
    data['count'] = count;
    data['good_sn'] = good_sn;
    data['images'] = images;
    data['detail'] = detail;
    data['freight'] = freight;
    return data;
  }

  CategoryGoodModel({
      this.id,
      this.category_first,
      this.category_second,
      this.name,
      this.price,
      this.discount_price,
      this.count,
      this.good_sn,
      this.images,
      this.detail,
      this.freight});
}
