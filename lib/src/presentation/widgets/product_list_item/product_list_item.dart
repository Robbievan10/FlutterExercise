import 'package:flutter/material.dart';

import '../../../data/models/product.dart';
import 'product_list_item_theme.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  final Function(Product) onChecked;
  final Function(Product) onDeleted;
  const ProductListItem(
      {Key? key,
      required this.product,
      required this.onChecked,
      required this.onDeleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductListItemTheme.separator,
        Text(product.name),
        Expanded(
          child: Container(),
        ),
        Checkbox(
          value: product.isChecked,
          onChanged: (value) {
            onChecked(product);
          },
        ),
        ProductListItemTheme.separator,
        IconButton(
            onPressed: () {
              onDeleted(product);
            },
            icon: const Icon(Icons.delete)),
      ],
    );
  }
}
