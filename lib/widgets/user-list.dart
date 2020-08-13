import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dd/models/user_model.dart';
import 'package:flutter_dd/pages/details_page.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

class UserList extends StatelessWidget {
  final String apiUrl = "https://randomuser.me/api/?results=10";

  Future<List<dynamic>> fetchUser() async {
    var result = await http.get(apiUrl);
    return jsonDecode(result.body)['results'];
  }

  String _name(dynamic user) {
    return user['name']['title'] +
        " " +
        user['name']['first'] +
        " " +
        user['name']['last'];
  }

  String _location(dynamic user) {
    return user['location']['country'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: " + user['dob']['age'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Container(
          child: FutureBuilder<List<dynamic>>(
              future: fetchUser(),
              // ignore: missing_return
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return OKToast(
                    child: ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(children: <Widget>[
                              ListTile(
                                  onTap: () {
                                    Users user = Users(
                                        _name(snapshot.data[index]),
                                        snapshot.data[index]['picture']
                                            ['large'],
                                        _location(snapshot.data[index]),
                                        _age(snapshot.data[index]));
                                    showToast(user.userName,
                                        position: ToastPosition.bottom);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => UserDetails(
                                                  users: user,
                                                )));
                                  },
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(snapshot
                                        .data[index]['picture']['large']),
                                  ),
                                  trailing: Text(_age(snapshot.data[index])),
                                  subtitle:
                                      Text(_location(snapshot.data[index])),
                                  title: Text(
                                    _name(snapshot.data[index]),
                                  ))
                            ]),
                          );
                        }),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
