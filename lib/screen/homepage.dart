import 'dart:convert';
import 'package:basic_api_calling/models/mainmodel.dart';
import 'package:basic_api_calling/models/username.dart';
import 'package:basic_api_calling/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            final user = users[index];
            final email = user.email;
            final gender = user.gender;
            // final name = user['name']['first'];
            // final imageurl = user['picture']['thumbnail'];
            final color = user.gender == 'male'
                ? Colors.blue.shade100
                : Colors.pink.shade100;
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.email),
              tileColor: color,
            );
          })),
    );
  }

  void fetchUsers() async {
    final response = await UserApi.fetchusers();
    setState(() {
      users = response;
    });
  }
}
