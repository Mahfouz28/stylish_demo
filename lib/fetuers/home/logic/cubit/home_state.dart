part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeSliderState extends HomeState {
  final int index;
  final List<String> images;

  HomeSliderState({required this.index, required this.images});
}

class HomeProductsLoading extends HomeState {}

class HomeProductsSuccessState extends HomeState {
  final List<Product> products;

  HomeProductsSuccessState(this.products);
}

class HomeProductsFailure extends HomeState {
  final String error;

  HomeProductsFailure({required this.error});
}
