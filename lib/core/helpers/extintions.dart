import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  /// Push a named route
  Future<T?> pushNamed<T extends Object?>(String route, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(route, arguments: arguments);
  }

  /// Replace current route with a named route
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String route, {
    Object? arguments,
    TO? result,
  }) {
    return Navigator.of(
      this,
    ).pushReplacementNamed<T, TO>(route, arguments: arguments, result: result);
  }

  /// Remove all routes until condition and push a new one
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String route, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(
      route,
      predicate ?? (route) => false,
      arguments: arguments,
    );
  }

  /// Pop current screen
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }
}
