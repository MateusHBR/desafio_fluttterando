// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffe_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoffeStore on _CoffeStoreBase, Store {
  final _$cartAtom = Atom(name: '_CoffeStoreBase.cart');

  @override
  ObservableList<CoffeCartModel> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(ObservableList<CoffeCartModel> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  final _$_CoffeStoreBaseActionController =
      ActionController(name: '_CoffeStoreBase');

  @override
  dynamic addCoffe(CoffeModel coffe) {
    final _$actionInfo = _$_CoffeStoreBaseActionController.startAction(
        name: '_CoffeStoreBase.addCoffe');
    try {
      return super.addCoffe(coffe);
    } finally {
      _$_CoffeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart}
    ''';
  }
}
