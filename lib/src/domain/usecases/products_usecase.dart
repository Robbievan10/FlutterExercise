import 'package:injectable/injectable.dart';

import '../../data/models/product.dart';
import '../repositories/products_repository.dart';

mixin ProductsUseCase {
  Future<List<Product>> getProducts();
  Future saveProduct(Product product);
  Future deleteProduct(String id);
  Future changeProductCheckState(String id);
}

@Injectable(as: ProductsUseCase)
class ProductsUseCaseAdapter with ProductsUseCase {
  final ProductsRepository _productsRepository;

  ProductsUseCaseAdapter(this._productsRepository);

  @override
  Future deleteProduct(String id) async {
    return await _productsRepository.deleteProduct(id);
  }

  @override
  Future<List<Product>> getProducts() async {
    return await _productsRepository.getProducts();
  }

  @override
  Future saveProduct(product) async {
    return await _productsRepository.saveProduct(product);
  }

  @override
  Future changeProductCheckState(String id) async {
    return await _productsRepository.changeProductCheckState(id);
  }
}
