class ProductCart {
  final int productId;
  final int productTypeId;
  final String productName;
  final String description;
  final String price;
  final int productQty;
  final String promotion;
  final String unit;
  final String productImg;
  final int amount;

  ProductCart({
    required this.productId,
    required this.productTypeId,
    required this.productName,
    required this.description,
    required this.price,
    required this.productQty,
    required this.promotion,
    required this.unit,
    required this.productImg,
    required this.amount,
  });

  factory ProductCart.fromJson(Map<String, dynamic> json) {
    return ProductCart(
      productId: json['Product_ID'],
      productTypeId: json['Product_Type_ID'],
      productName: json['Product_Name'],
      description: json['Description'],
      price: json['Price'],
      productQty: json['ProductQty'],
      promotion: json['Promotion'],
      unit: json['Unit'],
      productImg: json['Product_img'],
      amount: json['amount'],
    );
  }
}

// Define a model for the cart items
class CartItem {
  final int cartId;
  final int customerId;
  final List<ProductCart> products;
  final int totalCartAmount;

  CartItem({
    required this.cartId,
    required this.customerId,
    required this.products,
    required this.totalCartAmount,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<ProductCart> products = productList
        .map((productJson) => ProductCart.fromJson(productJson))
        .toList();

    return CartItem(
        cartId: json['cart_id'],
        customerId: json['Cus_id'],
        products: products,
        totalCartAmount: json['totalCartAmount']);
  }
}
