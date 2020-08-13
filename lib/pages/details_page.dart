import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dd/models/user_model.dart';

class UserDetails extends StatelessWidget {
  final Users users;

  UserDetails({this.users});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context, false),
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(users.userName),
        ),
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  Image(
                      height: 250.0,
                      width: double.infinity,
                      image: NetworkImage(users.imageUrl)),
                  Text(
                    users.userName,
                    style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    users.country,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(users.age),
                ],
              ),
            )),
      ),
    );
  }
}
