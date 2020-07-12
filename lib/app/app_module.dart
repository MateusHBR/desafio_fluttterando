import 'package:desafio_flutterando_coffe/app/modules/item/item_module.dart';
import 'package:desafio_flutterando_coffe/app/shared/stores/coffe_store.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:desafio_flutterando_coffe/app/app_widget.dart';
import 'package:desafio_flutterando_coffe/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => CoffeStore()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/item', module: ItemModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
