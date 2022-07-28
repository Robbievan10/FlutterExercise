import 'package:flutter/material.dart';

import '../../../core/state/base_state.dart';
import '../../../data/models/product.dart';
import '../../../domain/bloc/home_bloc.dart';
import '../../widgets/product_list_item/product_list_item.dart';
import '../../widgets/text_input/text_input.dart';
import 'home_page_theme.dart';

class HomePage extends StatefulWidget {
  static String route = 'homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc!.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.app_bar_title),
      ),
      body: Column(
        children: [
          Padding(
            padding: HomePageTheme.textFieldPadding,
            child: ProductInput(
              controller: bloc!.textController,
              hint: appLocalizations.enter_product_name,
            ),
          ),
          MaterialButton(
            onPressed: () {
              bloc!.saveProduct();
            },
            color: HomePageTheme.addProductButtonColor,
            shape: HomePageTheme.addProductButtonShape,
            child: Text(appLocalizations.add_product),
          ),
          HomePageTheme.separator,
          HomePageTheme.divider,
          Expanded(
            child: StreamBuilder<List<Product>?>(
              builder: ((context, snapshot) {
                if (snapshot.data != null && snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(appLocalizations.no_products),
                  );
                }
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.isNotEmpty) {
                  return ListView.separated(
                      itemBuilder: ((context, index) {
                        return ProductListItem(
                          product: snapshot.data![index],
                          onChecked: (product) {
                            bloc!.checkProduct(product.id!);
                          },
                          onDeleted: (product) {
                            bloc!.deleteProduct(product.id!);
                          },
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      },
                      itemCount: snapshot.data!.length);
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(appLocalizations.error),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
              stream: bloc!.prodcutsList,
            ),
          ),
        ],
      ),
    );
  }
}
