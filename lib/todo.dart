// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoUi extends StatefulWidget {
  const TodoUi({Key? key}) : super(key: key);

  @override
  State<TodoUi> createState() => _TodoUiState();
}

class _TodoUiState extends State<TodoUi> {
  Future<List<dynamic>> getdata() async {
    var res = await http.get(Uri.parse("https://10.0.2.2:8000/api/get"));
    return jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error"),
          );
        } else if (snapshot.hasData) {
          print(snapshot.data);
          return Center(child: Text("Has data"));
        }
        return Center(
          child: Text("Nimra"),
        );
      },
      future: getdata(),
    ));
  }
}
