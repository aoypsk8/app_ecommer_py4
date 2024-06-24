class ProductTypeModel {
  int productTypeId;
  String productTypeName;
  String img;

  ProductTypeModel({
    required this.productTypeId,
    required this.productTypeName,
    required this.img,
  });

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) {
    return ProductTypeModel(
      productTypeId: json['Product_Type_ID'],
      productTypeName: json['Product_Type_Name'],
      img: json['img'],
    );
  }
}
