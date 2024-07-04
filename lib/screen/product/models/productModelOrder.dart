class ProductOrderModel {
  String productName;
  String quantity;
  String price;
  String description;
  String productImg;
  String totalProduct;

  ProductOrderModel({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.description,
    required this.productImg,
    required this.totalProduct,
  });

  factory ProductOrderModel.fromJson(Map<String, dynamic> json) {
    return ProductOrderModel(
      productName: json['Product_Name'].toString(),
      quantity: json['quantity'].toString(),
      price: json['Price'].toString(),
      description: json['Description'].toString(),
      productImg: json['Product_img'].toString(),
      totalProduct: json['totalProduct'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Product_Name': productName,
      'quantity': quantity,
      'Price': price,
      'Description': description,
      'Product_img': productImg,
      'totalProduct': totalProduct,
    };
  }
}
