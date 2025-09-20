import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> signUp() async {
    if (formKey.currentState?.validate() != true) return;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      emit(LoginCubitFailure(message: "Email or password is empty"));
      print(' Email or password is empty');
      return;
    }

    emit(LoginCubitLoading());

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginCubitSuccess());
      print(' User created successfully');
      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      print(' FirebaseAuth Error: ${e.code} - ${e.message}');
      emit(LoginCubitFailure(message: e.message ?? 'Unknown Firebase error'));
    } catch (e) {
      print(' General Error: $e');
      emit(LoginCubitFailure(message: 'Something went wrong'));
    }
  }

  void signIn() async {
    if (formKey.currentState?.validate() != true) return;

    emit(LoginCubitLoading());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(LoginCubitSuccess());
      print(' User signed in successfully');
      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      print(' FirebaseAuth Error: ${e.code} - ${e.message}');
      emit(LoginCubitFailure(message: e.message ?? 'Unknown Firebase error'));
    }
  }
}
