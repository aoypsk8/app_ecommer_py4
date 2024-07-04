import 'package:easy_localization/easy_localization.dart';

class Product {
  final String productName;
  final int quantity;
  final String price;
  final String description;
  final String productImg;
  final int totalProduct;

  Product({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.description,
    required this.productImg,
    required this.totalProduct,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['Product_Name'],
      quantity: json['quantity'],
      price: json['Price'],
      description: json['Description'],
      productImg: json['Product_img'],
      totalProduct: json['totalProduct'],
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

class OrderModel {
  final int orderId;
  final String cusName;
  final DateTime orderDate;
  final int status;
  final String location;
  final String phone;
  final String imagePay;
  final int total;
  final List<Product> products;

  OrderModel({
    required this.orderId,
    required this.cusName,
    required this.orderDate,
    required this.status,
    required this.location,
    required this.phone,
    required this.imagePay,
    required this.total,
    required this.products,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<Product> productObjs = productList
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    return OrderModel(
      orderId: json['order_id'],
      cusName: json['Cus_name'],
      orderDate: DateTime.parse(json['order_date']),
      status: json['status'],
      location: json['Location'],
      phone: json['phone'],
      imagePay: json['ImagePay'],
      total: json['total'],
      products: productObjs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'Cus_name': cusName,
      'order_date': orderDate.toIso8601String(),
      'status': status,
      'Location': location,
      'phone': phone,
      'ImagePay': imagePay,
      'total': total,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  String getFormattedOrderDate() {
    final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm:ss');
    return formatter.format(orderDate);
  }
}
