class ProductModel {
  int productId;
  int productTypeId;
  String productName;
  String description;
  String price;
  int productQty;
  String promotion;
  String unit;
  String productImg;
  String? productTypeName;

  ProductModel({
    required this.productId,
    required this.productTypeId,
    required this.productName,
    required this.description,
    required this.price,
    required this.productQty,
    required this.promotion,
    required this.unit,
    required this.productImg,
    this.productTypeName,
  });

  // Factory method to create a Product instance from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['Product_ID'],
      productTypeId: json['Product_Type_ID'],
      productName: json['Product_Name'],
      description: json['Description'],
      price: json['Price'],
      productQty: json['ProductQty'],
      promotion: json['Promotion'],
      unit: json['Unit'],
      productImg: json['Product_img'],
      productTypeName: json['Product_Type_Name'],
    );
  }

  // Method to convert Product instance to JSON
  Map<String, dynamic> toJson() => {
        'Product_ID': productId,
        'Product_Type_ID': productTypeId,
        'Product_Name': productName,
        'Description': description,
        'Price': price,
        'ProductQty': productQty,
        'Promotion': promotion,
        'Unit': unit,
        'Product_img': productImg,
        'productTypeName': productTypeName,
      };
}
