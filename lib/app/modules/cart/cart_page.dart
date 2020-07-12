import 'package:desafio_flutterando_coffe/app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cart_controller.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key key, this.title = "Cart"}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ModularState<CartPage, CartController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundBlue,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.7,
              child: Observer(
                builder: (_) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8,
                    ),
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      var item = controller.list[index];

                      return Container(
                        height: size.height * 0.1,
                        child: Card(
                          color: AppColors.bottomBarBlue,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: AppColors.orange,
                                  child: Image(
                                    image: AssetImage(item.coffe.url),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      item.coffe.title,
                                      style: TextStyle(
                                        color: AppColors.beige,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '\$${item.coffe.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: AppColors.lightBrown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                      onPressed: () {
                                        controller.addCoffe(item.coffe);
                                      },
                                    ),
                                    Text(
                                      item.quantity.toString(),
                                      style: TextStyle(color: AppColors.orange),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        controller.removeCoffe(item.coffe);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Divider(
                      color: AppColors.beige,
                    ),
                    Observer(
                      builder: (_) {
                        return Text(
                          'Valor da compra: ${controller.finalValue}',
                          style: TextStyle(
                            color: AppColors.beige,
                          ),
                        );
                      },
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        color: AppColors.lightOrange,
                        child: Text(
                          'Finalizar Compra',
                          style: TextStyle(
                            color: AppColors.backgroundBlue,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
