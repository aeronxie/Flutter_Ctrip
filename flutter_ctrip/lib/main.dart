import 'package:flutter/material.dart';
import 'package:flutter_ctrip/navigator/tab_navigation.dart';

void main() => runApp(Ctrip());

class Ctrip extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNavigation()
    );
  }
}
