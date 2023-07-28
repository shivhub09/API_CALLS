import 'dart:convert';
import 'package:basic_api_calling/models/datemodel.dart';
import 'package:basic_api_calling/models/mainmodel.dart';
import 'package:basic_api_calling/models/user_location.dart';
import 'package:basic_api_calling/models/username.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchusers() async {
    print("fetchusers called");
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    final final_users = results.map((e) {
      return User.fromMap(e);
    }).toList();

    // print(users);
    return final_users;
  }
}
