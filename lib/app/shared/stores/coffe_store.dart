import 'package:desafio_flutterando_coffe/app/shared/models/coffe_model.dart';
import 'package:desafio_flutterando_coffe/app/shared/models/cofffe_cart_model.dart';
import 'package:mobx/mobx.dart';
part 'coffe_store.g.dart';

class CoffeStore = _CoffeStoreBase with _$CoffeStore;

abstract class _CoffeStoreBase with Store {
  @observable
  ObservableList<CoffeCartModel> cart = <CoffeCartModel>[].asObservable();

  @action
  addCoffe(CoffeModel coffe) {
    int index = cart.indexWhere((coffeCart) => coffeCart.coffe.id == coffe.id);

    if (index < 0) {
      cart.add(CoffeCartModel(coffe: coffe, quantity: 1));
    } else {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity++);
    }
  }

  removeCoffe(CoffeModel coffe) {
    int index = cart.indexWhere((coffeCart) => coffeCart.coffe.id == coffe.id);

    if (cart[index].quantity > 1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity--);
    } else {
      cart.removeAt(index);
    }
  }
}
