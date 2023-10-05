import 'package:flutter_catalog/models/catalog.dart';

class AddMutation{
  final Item item;

  AddMutation(this.item);
  perform() {
    var store;
    store?.cart._itemIds.add(item.id);
  }
}
