// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter_catalog/models/cart.dart';

class CatalogModel {
  late final CartModel cart;
  static List<Item> items = []; // initialize the items list

  // Get Item by ID
  Item getById(int id) => items.firstWhere((element) => element.id == id);

  // Get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  Item copyWith({
    required int id,
    required String name,
    required String desc,
    required num price,
    required String color,
    required String image,
  }) {
    return Item(
      id: id,
      name: name,
      desc: desc,
      price: price,
      color: color,
      image: image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic>? map) {
    if (map == null)
      return Item(
        id: 0,
        name: '',
        desc: '',
        price: 0,
        color: '',
        image: '',
      );

    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>?);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.id == id &&
        o.name == name &&
        o.desc == desc &&
        o.price == price &&
        o.color == color &&
        o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
