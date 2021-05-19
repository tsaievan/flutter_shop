class HomeContentModel {

  List<HomeBannerModel> banners;
  List<HomeCategoryModel> categories;
  List<HomeGoodModel> goods;

  HomeContentModel({this.banners, this.categories, this.goods});

  HomeContentModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = List<HomeBannerModel>();
      json['banners'].forEach((v) {
        banners.add(HomeBannerModel.fromJson(v));
      });
    }

    if (json['categories'] != null) {
      categories = List<HomeCategoryModel>();
      json['categories'].forEach((v) {
        categories.add(HomeCategoryModel.fromJson(v));
      });
    }

    if (json['goods'] != null) {
      goods = List<HomeGoodModel>();
      json['goods'].forEach((v) {
        goods.add(HomeGoodModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (banners != null) {
      data['banners'] = banners.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories.map((v) => v.toJson()).toList();
    }
    if (goods != null) {
      data['goods'] = goods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeBannerModel {
  String image;

  HomeBannerModel({this.image});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    return data;
  }
}

class HomeGoodModel {
  // id
  int id;
  // 价格
  int price;
  // 折扣价
  int discount_price;
  // 名称
  String name;
  // 编号
  int good_sn;
  // 图片
  String images;


  HomeGoodModel({this.id, this.price, this.discount_price, this.name,
      this.good_sn, this.images});

  HomeGoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    discount_price = json['discount_price'];
    name = json['name'];
    good_sn = json['good_sn'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['price'] = price;
    data['discount_price'] = discount_price;
    data['name'] = name;
    data['good_sn'] = good_sn;
    data['images'] = images;
    return data;
  }
}

class HomeCategoryModel {
  // id
  int id;
  // 名称
  String name;
  // 父分类id
  int pid;
  // 等级
  String level;
  // 图片
  String image;

  HomeCategoryModel({
    this.id, this.name, this.pid, this.level, this.image});

  HomeCategoryModel.fromJson(Map<String, dynamic> json) {
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