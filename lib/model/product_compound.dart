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

  static const List<ProductCompound> productsCompound = [];
}
