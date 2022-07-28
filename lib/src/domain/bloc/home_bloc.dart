import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/bloc/bloc.dart';
import '../../data/models/product.dart';
import '../usecases/products_usecase.dart';

@injectable
class HomeBloc extends Bloc {
  final textController = TextEditingController();

  final BehaviorSubject<bool> _canSubmit = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<Product>?> _productsList =
      BehaviorSubject.seeded([]);

  Stream<bool> get canSubmit => _canSubmit.stream;
  Stream<List<Product>?> get prodcutsList => _productsList.stream;

  final ProductsUseCase _productsUseCase;

  HomeBloc(this._productsUseCase);

  Future getProducts() async {
    try {
      final products = await _productsUseCase.getProducts();
      _productsList.value = products;
    } catch (e) {
      _productsList.addError(e);
    }
  }

  Future saveProduct() async {
    Product product = Product(
      name: textController.text,
    );
    await _productsUseCase.saveProduct(product);
    getProducts();
    textController.clear();
  }

  Future deleteProduct(String id) async {
    await _productsUseCase.deleteProduct(id);
    getProducts();
  }

  Future checkProduct(String id) async {
    await _productsUseCase.changeProductCheckState(id);
    getProducts();
  }

  @override
  void dispose() {
    _canSubmit.close();
    _productsList.close();
  }
}
