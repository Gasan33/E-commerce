import 'dart:convert';

List<Categories> postFromJson2(String str) =>
    List<Categories>.from(jsonDecode(str).map((x) => Categories.fromJson(x)));

class Categories {
  late int id;
  late String name;
  late String image;
  late String creationAt;
  late String updatedAt;

  Categories(
      {required this.id,
      required this.name,
      required this.image,
      required this.creationAt,
      required this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
