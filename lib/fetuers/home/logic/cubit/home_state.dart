part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeSliderState extends HomeState {
  final int index;
  final List<String> images;

  HomeSliderState({required this.index, required this.images});
}
