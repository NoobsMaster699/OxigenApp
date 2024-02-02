class Product {
  final String productName;
  final String productDesc;
  final String productSubtext;
  final double productPrice;
  final String imgPath;

  Product({
    required this.productName,
    required this.productDesc,
    required this.productSubtext,
    required this.productPrice,
    required this.imgPath,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['product_name'],
      productDesc: json['product_desc'],
      productSubtext: json['product_subtext'],
      productPrice: json['product_price'].toDouble(),
      imgPath: json['img_path'],
    );
  }
}
