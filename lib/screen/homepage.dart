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
        body: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items in each row
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 10.0, // Spacing between rows
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final color =
            user.gender == 'male' ? Colors.blue.shade100 : Colors.pink.shade100;
        return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 5, // Blur radius
                offset: Offset(0, 3), // Offset in the x, y direction
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(user.picture.medium),
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  "${user.username.title} ${user.username.first} ${user.username.last}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Text(
                    "${user.location.street.number}, ${user.location.street.name}, ${user.location.city}, ${user.location.country}"),
              ),
              Text("${user.phone}")
            ],
          ),
        );
      },
    ));
  }

  void fetchUsers() async {
    final response = await UserApi.fetchusers();
    setState(() {
      users = response;
    });
  }
}
