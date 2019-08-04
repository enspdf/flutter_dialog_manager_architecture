import 'package:flutter/material.dart';
import 'package:flutter_dialog_manager/locator.dart';
import 'package:flutter_dialog_manager/managers/dialog_manager.dart';
import 'package:flutter_dialog_manager/ui/home/home_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(
            child: widget,
          ),
        ),
      ),
      home: HomeView(),
    );
  }
}
