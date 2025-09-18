part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

class productLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> products;

  ProductSuccess(this.products);
}

class ProductFailure extends ProductState {
  final String error;

  ProductFailure(this.error);
}
