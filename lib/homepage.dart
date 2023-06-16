import 'dart:convert';

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
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: fetchusers,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            final user = users[index];
            final email = user['email'];
            final name = user['name']['first'];
            final imageurl = user['picture']['thumbnail'];
            return ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(imageurl)),
              subtitle: Text(email),
              title: Text(name.toString()),
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
    setState(() {
      users = json['results'];
    });
    print(users);

    print("users fetched");
  }
}
