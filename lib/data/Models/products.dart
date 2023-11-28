import 'dart:convert';

List<Products> postFromJson(String str) =>
    List<Products>.from(jsonDecode(str).map((x) => Products.fromJson(x)));

class Products {
  late int id;
  late String title;
  late int price;
  late String description;
  late List<String> images;
  late String creationAt;
  late String updatedAt;
  late Category category;

  // Products(
  //     {this.id,
  //     this.title,
  //     this.price,
  //     this.description,
  //     this.images,
  //     this.creationAt,
  //     this.updatedAt,
  //     this.category});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = (json['category'] != null
        ? Category.fromJson(json['category'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['images'] = images;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    data['category'] = category.toJson();
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
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
