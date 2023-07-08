import 'dart:convert';

List<Compounds> compoundProductsListFromJson(String val) =>
    List<Compounds>.from(
        json.decode(val)['compounds'].map((data) => Compounds.fromJson(data)));

class CompoundProducts {
  List<Compounds>? compounds;

  CompoundProducts({this.compounds});

  CompoundProducts.fromJson(Map<String, dynamic> json) {
    if (json['compounds'] != null) {
      compounds = <Compounds>[];
      json['compounds'].forEach((v) {
        compounds!.add(new Compounds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.compounds != null) {
      data['compounds'] = this.compounds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Compounds {
  int? id;
  String? name;
  int? price;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<ProductsCompound>? products;

  Compounds(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.products});

  Compounds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <ProductsCompound>[];
      json['products'].forEach((v) {
        products!.add(new ProductsCompound.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsCompound {
  int? id;
  String? productName;
  String? description;
  int? productQuantity;
  String? unit;
  String? productCode;
  String? productGarage;
  String? productRoute;
  String? productImage;
  String? expireDate;
  int? importPrice;
  int? exportPrice;
  int? productAmount;
  String? url;
  String? createdAt;
  String? updatedAt;
  int? categoryId;
  int? supplierId;
  int? brandId;
  Pivot? pivot;

  ProductsCompound(
      {this.id,
      this.productName,
      this.description,
      this.productQuantity,
      this.unit,
      this.productCode,
      this.productGarage,
      this.productRoute,
      this.productImage,
      this.expireDate,
      this.importPrice,
      this.exportPrice,
      this.productAmount,
      this.url,
      this.createdAt,
      this.updatedAt,
      this.categoryId,
      this.supplierId,
      this.brandId,
      this.pivot});

  ProductsCompound.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'] ?? 'Not Yet';
    description = json['description'] ?? 'Not Yet';
    productQuantity = json['product_quantity'] ?? 0;
    unit = json['unit'] ?? 'Not Yet';
    productCode = json['product_code'] ?? 'Not Yet';
    productGarage = json['product_garage'] ?? 'Not Yet';
    productRoute = json['product_route'] ?? 'Not Yet';
    productImage = json['product_image'] ??
        'https://shop.mevid.hu/wp-content/uploads/2019/11/image.jpg';
    expireDate = json['expire_date'] ?? 'Not Yet';
    importPrice = json['import_price'] ?? 0;
    exportPrice = json['export_price'] ?? 0;
    productAmount = json['product_amount'];
    url = json['url'] ?? 'Not Yet';
    createdAt = json['created_at'] ?? 'Not Yet';
    updatedAt = json['updated_at'] ?? 'Not Yet';
    categoryId = json['category_id'];
    supplierId = json['supplier_id'];
    brandId = json['brand_id'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['description'] = this.description;
    data['product_quantity'] = this.productQuantity;
    data['unit'] = this.unit;
    data['product_code'] = this.productCode;
    data['product_garage'] = this.productGarage;
    data['product_route'] = this.productRoute;
    data['product_image'] = this.productImage;
    data['expire_date'] = this.expireDate;
    data['import_price'] = this.importPrice;
    data['export_price'] = this.exportPrice;
    data['product_amount'] = this.productAmount;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_id'] = this.categoryId;
    data['supplier_id'] = this.supplierId;
    data['brand_id'] = this.brandId;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? compoundId;
  int? productsId;
  int? productQuantity;

  Pivot({this.compoundId, this.productsId, this.productQuantity});

  Pivot.fromJson(Map<String, dynamic> json) {
    compoundId = json['compound_id'];
    productsId = json['products_id'];
    productQuantity = json['product_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compound_id'] = this.compoundId;
    data['products_id'] = this.productsId;
    data['product_quantity'] = this.productQuantity;
    return data;
  }
}
