class UserModel {
  int id;
  String token;

  String username;

  String mobile;

  String address;

  String head_image;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    username = json['username'];
    mobile = json['mobile'];
    address = json['address'];
    head_image = json['head_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['token'] = token;
    data['username'] = username;
    data['mobile'] = mobile;
    data['address'] = address;
    data['head_image'] = head_image;
    return data;
  }

  UserModel({this.id, this.token, this.username, this.mobile, this.address,
      this.head_image});
}