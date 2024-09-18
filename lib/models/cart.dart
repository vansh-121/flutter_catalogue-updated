import 'package:flutter_catalogue/models/catalog.dart';

//Catalog field
class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  late CatalogModel _catalog;

  //Collecting IDs
  final List<int> _itemID = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Items in cart
  List<Product> get products =>
      _itemID.map((id) => _catalog.getById(id)).toList();

  //Calculate total prize
  num get totalPrice =>
      products.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Product product) {
    _itemID.add(product.id);
  }

  //Remove Item

  void remove(Product product) {
    _itemID.remove(product.id);
  }
}
