import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_app/src/models/product_model.dart';

class ProductDetailController extends GetxController{
  var selectedProduct = ProductModel().obs;
  var barcodes = <Barcode>[].obs;
  var counter = 0.obs;
  final player = AudioPlayer();

  void onDetect(List<Barcode> barcodes){
    this.barcodes.value = barcodes;

    for (var barcode in barcodes) {
      if (barcode.rawValue == selectedProduct.value.barcode) {
        counter.value++;
        player.play(AssetSource('beep-sound2.mp3'));
      }
    }
  }

  saveCounter(){
    ProductModel updatedProduct = selectedProduct.value.copyWith(
      quantity: counter.value,
    );

    selectedProduct.value = updatedProduct;
    resetCounter();
    Get.back();
  }

  void resetCounter(){
    counter.value = 0;
  }

  void setSelectedProduct(ProductModel product){
    selectedProduct.value = product;
    counter.value = product.quantity ?? 0;
    update();
  }
}