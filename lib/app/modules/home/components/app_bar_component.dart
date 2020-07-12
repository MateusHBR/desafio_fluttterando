import 'package:desafio_flutterando_coffe/app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget {
  final Function onTap;

  const AppBarComponent({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "PRODUCTS",
            style: TextStyle(
              color: AppColors.beige,
              fontSize: 26,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: onTap,
            child: Container(
              height: 40,
              width: 40,
              child: Image(
                height: 10,
                image: AssetImage("assets/cart_icon.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
