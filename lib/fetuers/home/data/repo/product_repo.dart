import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductRepository {
  final SupabaseClient clint;
  ProductRepository(this.clint);
  Future<List<Product>> fetchProducts() async {
    final product = await clint
        .from('products')
        .select()
        .order('title', ascending: true);

    return (product as List)
        .map(
          (json) => Product(
            image: json['image'] as String,
            title: json['title'] as String,
            description: json['description'] as String,
            price: json['price'] as String,
            oldPrice: json['old_price'] as String? ?? '',
            discount: json['discount'] as String? ?? '',
            numberOfReviews: json['number_of_reviews'] as String? ?? '',
          ),
        )
        .toList();
  }

  Future<void> addProduct(Product product) async {
    await clint.from('products').insert({
      'image': product.image,
      'title': product.title,
      'description': product.description,
      'price': product.price,
      'old_price': product.oldPrice,
      'discount': product.discount,
      'number_of_reviews': product.numberOfReviews,
    });
  }
}
