part of 'login_cubit_cubit.dart';

abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {}

class LoginCubitLoading extends LoginCubitState {}

class LoginCubitSuccess extends LoginCubitState {}

class LoginCubitFailure extends LoginCubitState {
  final String message;
  LoginCubitFailure({required this.message});
}
