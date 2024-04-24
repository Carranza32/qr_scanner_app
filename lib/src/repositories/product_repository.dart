import '../models/product_model.dart';

class ProductRepository {

  Future<List<ProductModel>> generateProducts() async{
    List<ProductModel> products = [];
    await Future.delayed(const Duration(seconds: 2));

    for (var i = 0; i < 50; i++) {
      if (i == 1) {
        products.add(ProductModel(
          id: i.toString(),
          name: 'Product $i',
          barcode: 'CODE 39',
          quantity: 0,
        ));
      }else{
        products.add(ProductModel(
          id: i.toString(),
          name: 'Product $i',
          barcode: '010210120120',
          quantity: 0,
        ));
      }
    }

    return products;
  }
  
}