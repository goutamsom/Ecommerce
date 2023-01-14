import 'package:myfirstproject/Models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartMode {
  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

//add item

  void add(Item item) {
    _itemIds.add(item.id);
  }

//remove items

  // void remove(Item item) {
  //_itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemovMutation extends VxMutation<MyStore> {
  final Item item;
  RemovMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
