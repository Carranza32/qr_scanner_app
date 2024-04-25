import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_scanner_app/src/models/product_model.dart';

import '../repositories/product_repository.dart';

class ProductListController extends GetxController{
  final ProductRepository _productRepository = ProductRepository();

  var products = <ProductModel>[].obs;
  var isLoading = false.obs;
  var search = ''.obs;
  final _getStorage = GetStorage();

  @override
  void onInit() async{
    // await _getStorage.erase();
    var productsStorage = await _getStorage.read('products');

    if(productsStorage != null){
      for (var product in productsStorage) {
        products.add(ProductModel.fromJson(product));
      }
    }else{
      generateProducts();
    }

    super.onInit();
  }

  void onSearch(String value){
    search.value = value;
  }

  void generateProducts() async {
    isLoading.value = true;

    List<ProductModel> list = await _productRepository.generateProducts();
    products.value = list;
    _getStorage.write('products', list);

    isLoading.value = false;
  }
}