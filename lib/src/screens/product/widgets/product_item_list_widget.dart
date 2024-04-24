import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class ProductItemListWidget extends StatelessWidget {
  final ProductModel product;
  final int index;
  final Function(ProductModel) onTap;
  const ProductItemListWidget({super.key, required this.product, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id ?? '',
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: ListTile(
          leading: CircleAvatar(
            child: Image.asset('assets/product.png'),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          title: Text(product.barcode!),
          subtitle: Text('Cantidad: ${product.quantity ?? 0}'),
          onTap: () => onTap(product),
        ),
      ),
    );
  }
}