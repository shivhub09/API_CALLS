import 'dart:convert';

import 'package:basic_api_calling/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: fetchusers,
        focusColor: Colors.green.shade100,
      ),
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
              title: Text(email),
              subtitle: Text(user.phone),
              tileColor: color,
            );
          })),
    );
  }

  void fetchusers() async {
    print("fetchusers called");
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    final transformed = results.map((e) {
      return User(
          gender: e['gender'],
          email: e['email'],
          cell: e['cell'],
          nat: e['nat'],
          phone: e["phone"]);
    }).toList();
    setState(() {
      users = transformed;
    });
    // print(users);

    print("users fetched");
  }
}
