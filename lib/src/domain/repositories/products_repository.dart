import 'package:injectable/injectable.dart';

import '../../data/datasources/local/product_db.dart';
import '../../data/models/product.dart';

mixin ProductsRepository {
  Future<List<Product>> getProducts();
  Future saveProduct(Product product);
  Future deleteProduct(String id);
  Future changeProductCheckState(String id);
}

@Injectable(as: ProductsRepository)
class ProductsUseCaseAdapter with ProductsRepository {
  final ProductDb _productDb;

  ProductsUseCaseAdapter(this._productDb);

  @override
  Future deleteProduct(String id) async {
    return await _productDb.deleteProduct(id);
  }

  @override
  Future<List<Product>> getProducts() async {
    return await _productDb.getAllProducts();
  }

  @override
  Future saveProduct(product) async {
    return await _productDb.saveProduct(product);
  }

  @override
  Future changeProductCheckState(String id) async {
    return await _productDb.changeProductCheckState(id);
  }
}
