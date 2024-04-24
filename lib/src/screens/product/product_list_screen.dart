import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/src/controllers/ProductDetailController.dart';
import 'package:animations/animations.dart';
import 'package:qr_scanner_app/src/screens/product/product_form_screen.dart';

import '../../controllers/ProductListController.dart';
import 'widgets/product_list_widget.dart';

// ignore: must_be_immutable
class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  ProductListController controller = Get.put(ProductListController());
  ProductDetailController productDetailController = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Productos'),
      ),
      body: Column(
        children: [
          PreferredSize(
            preferredSize: const Size.fromHeight(64.0),
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
              child: SearchAnchor.bar(
                barElevation: MaterialStateProperty.all(3),
                viewElevation: 4,
                isFullScreen: true,
                viewHintText: 'Busca un producto',
                barHintText: 'Busca un producto',
                suggestionsBuilder: (context, text) {
                  return [
                  ];
                }
              ),
            ),
          ),

          Expanded(
            child: ProductListWidget(),
          ),
        ],
      ),
      floatingActionButton: OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (context, action) {
          return ProductFormScreen();
        },
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(17.0)),
        ),
        closedBuilder: (context, action) {
          return const FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.format_list_bulleted_add),
          );
        },
      ),
    );
  }
}