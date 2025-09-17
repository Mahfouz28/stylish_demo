import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  Timer? _timer;

  HomeCubit() : super(HomeInitial());

  final List<String> _images = [
    'assets/images/Rectangle 48.png',
    'assets/images/Rectangle 49.png',
    'assets/images/Rectangle 50.png',
  ];

  List<String> get images => _images;

  void startSlider() {
    emit(HomeSliderState(index: 0, images: _images));

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      next();
    });
  }

  void next() {
    if (state is! HomeSliderState) return;
    final s = state as HomeSliderState;
    final newIndex = (s.index + 1) % _images.length;
    emit(HomeSliderState(index: newIndex, images: _images));
  }

  void goTo(int index) {
    emit(HomeSliderState(index: index, images: _images));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
