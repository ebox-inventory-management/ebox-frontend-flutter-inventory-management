class ProductCompound {
  final int id;
  final String product_name;
  final String product_image;
  final int export_price;

  ProductCompound({
    required this.id,
    required this.product_name,
    required this.product_image,
    required this.export_price,
  });

  factory ProductCompound.fromJson(Map<String, dynamic> data) {
    return ProductCompound(
      id: data['id'],
      product_name: data['product_name'],
      product_image: data['product_image'],
      export_price: data['export_price'],
    );
  }
}
