import 'package:desafio_flutterando_coffe/app/modules/home/components/app_bar_component.dart';
import 'package:desafio_flutterando_coffe/app/modules/home/components/item_page_view_component.dart';
import 'package:desafio_flutterando_coffe/app/modules/home/components/progress_indicator.dart';
import 'package:desafio_flutterando_coffe/app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Products"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use  'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBarComponent(
              onTap: () {},
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.7,
              child: PageView.builder(
                onPageChanged: controller.onPageChanged,
                controller: controller.pageController,
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.coffeList.length,
                itemBuilder: (context, index) {
                  return ItemPageViewComponent(
                    coffeModel: controller.coffeList[index],
                  );
                },
              ),
            ),
            ProgressIndicatorComponent(listLength: controller.coffeList.length),
            Container(
              width: size.width,
              height: 60,
              color: Color(0xff23283E),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.lista.length,
                itemBuilder: (context, index) {
                  return MaterialButton(
                    height: 60,
                    onPressed: controller.lista[index]["function"],
                    child: Text(
                      controller.lista[index]["title"],
                      style: TextStyle(
                        color: AppColors.beige,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
