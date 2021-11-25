import 'package:sampleproject/core/store.dart';
import 'package:sampleproject/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //Catalog field
  late CatalogModel _catalog;

  //Collection of IDs -store IDs of each item
  final List<int> _itemIds = [];

  // Get Catalog
  // ignore: unnecessary_getters_setters
  CatalogModel get catalog => _catalog;

  // ignore: unnecessary_getters_setters
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getByID(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
