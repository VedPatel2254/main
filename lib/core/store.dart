import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';

class MyStore1 {
  CatalogModel catalog = CatalogModel(); // Initialize catalog here
  CartModel cart = CartModel(); // Initialize cart here

  MyStore1() {
    cart.catalog = catalog;
  }
}
