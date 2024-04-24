class ProductModel {
  String? id;
  String? barcode;
  String? name;
  int? quantity;
  String? image;
  String? description;

  ProductModel({this.id, this.barcode, this.name, this.quantity, this.image, this.description});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barcode = json['barcode'];
    name = json['name'];
    quantity = json['quantity'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['barcode'] = barcode;
    data['name'] = name;
    data['quantity'] = quantity;
    data['image'] = image;
    data['description'] = description;
    return data;
  }

  ProductModel copyWith({
    String? id,
    String? barcode,
    String? name,
    int? quantity,
    String? image,
    String? description,
  }) {
    return ProductModel(
      id: id ?? this.id,
      barcode: barcode ?? this.barcode,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }
}