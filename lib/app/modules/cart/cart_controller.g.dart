// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  Computed<List<CoffeCartModel>> _$listComputed;

  @override
  List<CoffeCartModel> get list =>
      (_$listComputed ??= Computed<List<CoffeCartModel>>(() => super.list,
              name: '_CartControllerBase.list'))
          .value;
  Computed<double> _$finalValueComputed;

  @override
  double get finalValue =>
      (_$finalValueComputed ??= Computed<double>(() => super.finalValue,
              name: '_CartControllerBase.finalValue'))
          .value;

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  dynamic addCoffe(CoffeModel coffeModel) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.addCoffe');
    try {
      return super.addCoffe(coffeModel);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeCoffe(CoffeModel coffeModel) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeCoffe');
    try {
      return super.removeCoffe(coffeModel);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
finalValue: ${finalValue}
    ''';
  }
}
