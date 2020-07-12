import 'package:desafio_flutterando_coffe/app/shared/models/coffe_model.dart';
import 'package:desafio_flutterando_coffe/app/shared/models/cofffe_cart_model.dart';
import 'package:desafio_flutterando_coffe/app/shared/stores/coffe_store.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final CoffeStore _coffeStore;

  _CartControllerBase(this._coffeStore);

  @computed
  List<CoffeCartModel> get list => _coffeStore.cart;

  @action
  addCoffe(CoffeModel coffeModel) {
    _coffeStore.addCoffe(coffeModel);
  }

  @action
  removeCoffe(CoffeModel coffeModel) {
    _coffeStore.removeCoffe(coffeModel);
  }

  @computed
  double get finalValue => _coffeStore.finalValue;
}
