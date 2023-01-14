import 'package:myfirstproject/Models/cart.dart';
import 'package:myfirstproject/Models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartMode cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartMode();
    cart.catalog = catalog;
  }
}
