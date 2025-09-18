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

// trinding proudacts
final List<Product> trendingProducts = [
  Product(
    image: 'assets/shoping images/shose.png',
    title: 'HRX by Hrithik Roshan',
    description: 'Comfortable running shoes for daily workouts',
    price: '2499',
    oldPrice: '4999',
    discount: '50',
    numberOfReviews: '35235',
  ),
  Product(
    image: 'assets/shoping images/girl.png',
    title: 'Women Printed Kurta',
    description: 'Neque porro quisquam est qui dolorem ipsum quia',
    price: '1500',
    oldPrice: '2499',
    discount: '40',
    numberOfReviews: '42000',
  ),
  Product(
    image: 'assets/shoping images/watch.png',
    title: 'IWC Schaffhausen',
    description: '2021 Pilot\'s Watch "SIHH 2019" 44mm',
    price: '650',
    oldPrice: '1599',
    discount: '60',
    numberOfReviews: '64588',
  ),
];
// deal of the day prodacts
final List<Product> dealOFTheDayProducts = [
  Product(
    image: 'assets/shoping images/shose.png',
    title: 'HRX by Hrithik Roshan',
    description: 'Comfortable running shoes for daily workouts',
    price: '2499',
    oldPrice: '4999',
    discount: '50',
    numberOfReviews: '35235',
  ),
  Product(
    image: 'assets/shoping images/girl.png',
    title: 'Women Printed Kurta',
    description: 'Neque porro quisquam est qui dolorem ipsum quia',
    price: '1500',
    oldPrice: '2499',
    discount: '40',
    numberOfReviews: '42000',
  ),
  Product(
    image: 'assets/shoping images/watch.png',
    title: 'IWC Schaffhausen',
    description: '2021 Pilot\'s Watch "SIHH 2019" 44mm',
    price: '650',
    oldPrice: '1599',
    discount: '60',
    numberOfReviews: '64588',
  ),
];
