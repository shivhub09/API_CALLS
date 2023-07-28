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
      final name = UserName(
          title: e["name"]["title"],
          first: e["name"]["first"],
          last: e["name"]["last"]); 
      final coordinates = LocationCoordinate(latitude: e['location']['coordinates']['latitude'], longitude: e['location']['coordinates']['longitude']);
      final birth = userDob(date: DateTime.parse(e['dob']['date']), age: e['dob']['age']);
      final street = LocationStreet(number: e['location']['street']['number'], name: e['location']['street']['name']);
      final timezone = LocationTimeZoneCoordinate(offset: e['location']['timezone']['offset'], description:  e['location']['timezone']['description']);
      final location = userLocation(city: e['location']['city'], state: e['location']['state'], country: e['location']['country'], 
       postcode:e['location']['postcode'].toString(), street: street, coordinates: coordinates, timezone: timezone);


      return User(
        gender: e['gender'],
        email: e['email'],
        cell: e['cell'],
        nat: e['nat'],
        phone: e["phone"],
        username: name,
        dateofbirth: birth,
        location: location
      );
    }).toList();

    // print(users);
    return final_users;
  }
}
