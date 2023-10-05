import 'package:flutter_catalog/models/catalog.dart';

class RemoveMutation {
  final Item item;

  RemoveMutation(this.item);
  perform() {
    var store;
    store?.cart._itemIds.remove(item.id);
  }
}
