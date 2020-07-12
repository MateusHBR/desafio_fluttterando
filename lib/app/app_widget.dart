import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import './shared/utils/global_scaffold.dart';
// import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Scaffold(
          key: GlobalScaffold.instance.scaffKey,
          body: child,
        );
      },
      // builder: asuka.builder,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        backgroundColor: Color(0xff1B2037),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
