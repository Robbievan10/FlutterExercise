import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../models/product.dart';

mixin ProductDb {
  Future<List<Product>> getAllProducts();
  Future saveProduct(Product product);
  Future deleteProduct(String id);
  Future changeProductCheckState(String id);
}

@Injectable(as: ProductDb)
class ProductDbAdapter with ProductDb {
  @override
  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    try {
      final completer = Completer<List<Product>>();
      final box = await Hive.openBox('products');
      products = box.values.toList().cast<Product>();
      completer.complete(products);
      return completer.future;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future saveProduct(Product product) async {
    try {
      final box = await Hive.openBox('products');
      box.put(product.id, product);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteProduct(String id) async {
    try {
      final box = await Hive.openBox('products');
      await box.delete(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future changeProductCheckState(String id) async {
    final box = await Hive.openBox('products');
    Product product = await box.get(id);
    product.isChecked = !product.isChecked!;
    await box.put(product.id, product);
  }
}
