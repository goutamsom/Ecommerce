import 'package:flutter/material.dart';
import 'package:myfirstproject/pages/login.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/store.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      //home: Homepage(),
    );
  }
}
