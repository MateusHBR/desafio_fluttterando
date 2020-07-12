import 'package:desafio_flutterando_coffe/app/shared/animations/fade_animation.dart';
import 'package:desafio_flutterando_coffe/app/shared/colors/app_colors.dart';
import 'package:desafio_flutterando_coffe/app/shared/models/coffe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'item_controller.dart';
import 'package:desafio_flutterando_coffe/app/shared/utils/global_scaffold.dart';

class ItemPage extends StatefulWidget {
  final CoffeModel coffeModel;

  const ItemPage({Key key, @required this.coffeModel}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends ModularState<ItemPage, ItemController> {
  //use 'controller' variable to access controller
  final snackbar = SnackBar(
    content: Text('Item adicionado ao carrinho'),
    backgroundColor: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: size.height * 0.6,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 25),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Modular.to.pop();
                      },
                    ),
                  ),
                  Container(
                    height: size.height * 0.6,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Material(
                      color: Colors.transparent,
                      child: Stack(
                        children: <Widget>[
                          Hero(
                            tag: widget.coffeModel.id,
                            child: Container(
                              height: size.height * 0.4,
                              width: size.height * 0.4,
                              child: FadeAnimation(
                                delay: 0.8,
                                child: Image.asset(
                                  widget.coffeModel.url,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                      delay: 1.0,
                      child: Text(
                        widget.coffeModel.title,
                        style: TextStyle(
                          color: AppColors.lightBrown,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.2,
                      child: Text(
                        widget.coffeModel.subtitle,
                        style: TextStyle(
                          color: AppColors.brown,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.4,
                      child: Text(
                        widget.coffeModel.text,
                        style: TextStyle(
                          height: 1.5,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '\$${widget.coffeModel.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.beige,
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.lightOrange,
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/buy_icon.png'),
                                    ),
                                  ),
                                ),
                                Material(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  color: Colors.transparent,
                                  child: ClipRRect(
                                    child: InkWell(
                                      onTap: () {
                                        controller.addCoffe(widget.coffeModel);
                                        GlobalScaffold.instance
                                            .showSnackBar(snackbar);
                                      },
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
