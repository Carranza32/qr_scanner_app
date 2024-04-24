import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:qr_scanner_app/src/models/product_model.dart';

import '../../../controllers/ProductDetailController.dart';
import '../../../controllers/ProductListController.dart';
import 'product_item_list_widget.dart';

// ignore: must_be_immutable
class ProductListWidget extends StatelessWidget {
  ProductListWidget({super.key});

  ProductListController controller = Get.put(ProductListController());
  ProductDetailController productDetailController = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    var list = controller.products;

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        controller.generateProducts();
      },
      child: Obx(() => controller.isLoading.value ? 
        _shimmerList() : 
        _buildList(list)),
    );
  }

  _shimmerList(){
    return (Get.isDarkMode) ?
      DarkCardListSkeleton(
        isCircularImage: true,
        isBottomLinesActive: true,
        length: 10,
      ) :
      CardListSkeleton(
        isCircularImage: true,
        isBottomLinesActive: true,
        length: 10,
      );
  }

  _buildList(List<ProductModel> list){
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ProductItemListWidget(
                  product: list[i],
                  index: i,
                  onTap: (product) {
                    productDetailController.setSelectedProduct(product);
                    
                    Get.toNamed('/product-detail')?.then((value) {
                      controller.products[i] = productDetailController.selectedProduct.value;
                    });
                  },
                ),
              )
            ),
          );
        },
      ),
    );
  }
}