class Product {
  final String image; // Public/Signed URL من Supabase
  final String title;
  final String description;
  final String price;
  final String oldPrice;
  final String discount;
  final String numberOfReviews;

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.numberOfReviews,
  });

  // تحويل من JSON (مثلاً جاي من Supabase)
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      oldPrice: json['old_price'] ?? '',
      discount: json['discount'] ?? '',
      numberOfReviews: json['number_of_reviews'] ?? '',
    );
  }

  // تحويل لـ JSON (قبل الإرسال لجدول Supabase)
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'price': price,
      'old_price': oldPrice,
      'discount': discount,
      'number_of_reviews': numberOfReviews,
    };
  }
}
