import 'package:desafio_flutterando_coffe/app/shared/models/coffe_model.dart';

class CoffeCartModel {
  CoffeModel coffe;
  int quantity;

  CoffeCartModel({this.coffe, this.quantity});

  copyWith({CoffeModel coffe, int quantity}) {
    return CoffeCartModel(
      coffe: coffe ?? this.coffe,
      quantity: quantity ?? this.quantity,
    );
  }
}
