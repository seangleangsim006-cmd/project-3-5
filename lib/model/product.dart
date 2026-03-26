class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Specs? specs;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.specs,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      specs: json['specs'] != null ? new Specs.fromJson(json['specs']) : null,
    );
  }
}

class Specs {
  String? cpu;
  String? ram;
  String? storage;
  String? display;
  String? gpu;
  String? battery;

  Specs({
    this.cpu,
    this.ram,
    this.storage,
    this.display,
    this.gpu,
    this.battery,
  });

  factory Specs.fromJson(Map<String, dynamic> json) {
    return Specs(
      cpu: json['cpu'],
      ram: json['ram'],
      storage: json['storage'],
      display: json['display'],
      gpu: json['gpu'],
      battery: json['battery'],
    );
  }
}
