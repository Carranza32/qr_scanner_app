import '../models/product_model.dart';

class ProductRepository {

  Future<List<ProductModel>> generateProducts() async{
    List<ProductModel> products = [];
    await Future.delayed(const Duration(seconds: 2));

    products.add(ProductModel(
      id: '1',
      barcode: 'CODE 39',
      name: 'Producto 1',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '2',
      barcode: 'CODE 93',
      name: 'Producto 2',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '3',
      barcode: 'BARCODE 128',
      name: 'Producto 3',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '4',
      barcode: 'Barcode 128',
      name: 'Producto 4',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '5',
      barcode: '987234',
      name: 'Producto 5',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '6',
      barcode: '1234567890',
      name: 'Producto 6',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '7',
      barcode: '9876543217',
      name: 'Producto 7',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '8',
      barcode: '1234567898',
      name: 'Producto 8',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '9',
      barcode: '98765432109',
      name: 'Producto 9',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '10',
      barcode: '123456789010',
      name: 'Producto 10',
      description: 'Descripción del producto',
      quantity: 0
    ));
    
    products.add(ProductModel(
      id: '11',
      barcode: '98765432111',
      name: 'Producto 11',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '12',
      barcode: '12345678912',
      name: 'Producto 12',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '13',
      barcode: '987654321013',
      name: 'Producto 13',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '14',
      barcode: '123456789014',
      name: 'Producto 14',
      description: 'Descripción del producto',
      quantity: 0
    ));

    products.add(ProductModel(
      id: '15',
      barcode: '98765432115',
      name: 'Producto 15',
      description: 'Descripción del producto',
      quantity: 0
    ));

    return products;
  }
  
}