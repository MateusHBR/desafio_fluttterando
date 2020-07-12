import 'package:desafio_flutterando_coffe/app/shared/models/coffe_model.dart';
import 'package:desafio_flutterando_coffe/app/shared/stores/coffe_store.dart';
import 'package:mobx/mobx.dart';

part 'item_controller.g.dart';

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  final CoffeStore _coffeStore;

  _ItemControllerBase(this._coffeStore);

  @action
  addCoffe(CoffeModel coffe) {
    _coffeStore.addCoffe(coffe);
  }
}
