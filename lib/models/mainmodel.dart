import 'package:basic_api_calling/models/datemodel.dart';
import 'package:basic_api_calling/models/user_location.dart';
import 'package:basic_api_calling/models/username.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName username;
  final userDob dateofbirth;
  final userLocation location;

  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.username,
      required this.dateofbirth,
      required this.location});

  String get fullName {
    return '${username.title} ${username.first} ${username.last}';
  }
}
