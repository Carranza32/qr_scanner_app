import 'package:get/get.dart';
import 'package:qr_scanner_app/src/models/product_model.dart';

import '../repositories/product_repository.dart';

class ProductListController extends GetxController{
  final ProductRepository _productRepository = ProductRepository();

  var products = <ProductModel>[].obs;
  var isLoading = false.obs;
  var search = ''.obs;

  @override
  void onInit() {
    generateProducts();

    super.onInit();
  }

  void onSearch(String value){
    search.value = value;
  }

  void generateProducts() async {
    isLoading.value = true;

    products.value = await _productRepository.generateProducts();

    isLoading.value = false;
  }
}