import 'package:desafio_flutterando_coffe/app/shared/models/coffe_model.dart';
import 'package:desafio_flutterando_coffe/app/shared/stores/coffe_store.dart';
import 'package:desafio_flutterando_coffe/app/shared/utils/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter/material.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final CoffeStore _coffeStore;

  _HomeControllerBase(this._coffeStore);

  @override
  void dispose() {
    pageController.dispose();
  }

  @observable
  ObservableList<CoffeModel> coffeList = <CoffeModel>[
    CoffeModel(
      id: 1,
      price: 10.0,
      title: TITLE,
      subtitle: SUBTITLE,
      text: TEXT,
      url: 'assets/product1.png',
    ),
    CoffeModel(
      id: 2,
      price: 11.0,
      title: TITLE,
      subtitle: SUBTITLE,
      text: TEXT,
      url: 'assets/product2.png',
    ),
    CoffeModel(
      id: 3,
      price: 12.0,
      title: TITLE,
      subtitle: SUBTITLE,
      text: TEXT,
      url: 'assets/product3.png',
    ),
    CoffeModel(
      id: 4,
      price: 13.0,
      title: TITLE,
      subtitle: SUBTITLE,
      text: TEXT,
      url: 'assets/product4.png',
    ),
    CoffeModel(
      id: 5,
      price: 14.0,
      title: TITLE,
      subtitle: SUBTITLE,
      text: TEXT,
      url: 'assets/product5.png',
    ),
  ].asObservable();

  final PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );

  @observable
  int currentPage = 1;

  @observable
  double percent = 0.2;

  @action
  onPageChanged(value) {
    if (value > currentPage - 1) {
      percent += 0.2;
    } else {
      percent -= 0.2;
    }
    currentPage = value + 1;
  }

  final List<Map<String, dynamic>> lista = [
    {
      "title": "RECIPES",
      "function": () {},
    },
    {
      "title": "SHIPPING",
      "function": () {},
    },
    {
      "title": "SUBSCRIPTIONS",
      "function": () {},
    },
    {
      "title": "PAYMENT",
      "function": () {},
    },
  ];

  @action
  addCoffe(CoffeModel coffe) {
    _coffeStore.addCoffe(coffe);
  }
}
