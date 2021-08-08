class CatalogueModel {
  static List<Product>? items;
}

class Product {
  final int? id;
  final String? title;
  final String? description;
  final num? price;
  final String? category;
  final String? color;
  final String? image;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.color,
      this.category,
      this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        color: json["color"],
        category: json["category"],
        image: json["image"]);
  }

  toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "color": color,
        "category": category,
        "image": image
      };

  @override
  String toString() {
    // TODO: implement toString
    return "${
        {
          "id": id,
          "title": title,
          "description": description,
          "price": price,
          "color": color,
          "category": category,
          "image": image
        }
    }";
  }
}
