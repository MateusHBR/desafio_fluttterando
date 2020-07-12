import 'package:desafio_flutterando_coffe/app/modules/home/home_controller.dart';
import 'package:desafio_flutterando_coffe/app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProgressIndicatorComponent extends StatelessWidget {
  final int listLength;
  final controller = Modular.get<HomeController>();

  ProgressIndicatorComponent({Key key, @required this.listLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Observer(
              builder: (_) {
                return Text(
                  '${controller.currentPage}/${listLength}',
                  style: TextStyle(color: AppColors.beige),
                );
              },
            ),
          ),
          Container(
            height: 2,
            alignment: Alignment.centerLeft,
            width: size.width * 0.5,
            child: Observer(
              builder: (_) {
                return LinearProgressIndicator(
                  value: controller.percent,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.grey),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
