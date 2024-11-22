// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.product,
  });

  List<Product> product;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product": List<dynamic>.from(product.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.summary,
    required this.description,
    required this.stock,
    required this.condition,
    required this.status,
    required this.thumbnail,
    required this.price,
    required this.discount,
    required this.catId,
    required this.images,
  });

  int id;
  String title;
  String slug;
  String summary;
  String description;
  int stock;
  String condition;
  String status;
  String thumbnail;
  int price;
  int discount;
  int catId;
  List<Images> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    summary: json["summary"],
    description: json["description"],
    stock: json["stock"],
    condition: json["condition"],
    status: json["status"],
    thumbnail: json["thumbnail"],
    price: json["price"],
    discount: json["discount"],
    catId: json["cat_id"],
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "summary": summary,
    "description": description,
    "stock": stock,
    "condition": condition,
    "status": status,
    "thumbnail": thumbnail,
    "price": price,
    "discount": discount,
    "cat_id": catId,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Images {
  Images({
    required this.id,
    required this.productId,
    required this.image,
  });

  int id;
  int productId;
  String image;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    productId: json["product_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "image": image,
  };
}
