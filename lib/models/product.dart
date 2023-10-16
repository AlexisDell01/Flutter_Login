import 'dart:convert';

class Product {
  bool availabe;
  String? description;
  String name;
  String? pic;
  int price;
  String? id;

  Product(
      {required this.availabe,
      this.description,
      required this.name,
      this.pic,
      required this.price,
      this.id});

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        availabe: json["availabe"],
        description: json["description"],
        name: json["name"],
        pic: json["pic"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "availabe": availabe,
        "description": description,
        "name": name,
        "pic": pic,
        "price": price,
      };
}
