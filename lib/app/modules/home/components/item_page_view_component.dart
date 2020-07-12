import 'package:desafio_flutterando_coffe/app/shared/colors/app_colors.dart';
import 'package:desafio_flutterando_coffe/app/shared/models/coffe_model.dart';
import 'package:flutter/material.dart';

class ItemPageViewComponent extends StatelessWidget {
  final CoffeModel coffeModel;

  const ItemPageViewComponent({@required this.coffeModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.7,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightOrange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                coffeModel.url,
                scale: 5,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.only(top: 20, bottom: 20),
            height: size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  coffeModel.title,
                  style: TextStyle(
                    color: AppColors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  coffeModel.subtitle,
                  style: TextStyle(
                    letterSpacing: 0.8,
                    color: AppColors.lightBrown,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  coffeModel.text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(height: 1.4),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '\$${coffeModel.price}',
                      style: TextStyle(
                        color: AppColors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.lightOrange,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/buy_icon.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
