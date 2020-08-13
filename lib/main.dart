import 'package:flutter/material.dart';
import 'file:///G:/Flutter%20Projects/flutter_dd/lib/widgets/user-list.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserList(),
      );
  }




}
