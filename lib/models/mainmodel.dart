import 'package:basic_api_calling/models/datemodel.dart';
import 'package:basic_api_calling/models/picturemodel.dart';
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

  
  factory User.fromMap(Map<String , dynamic> e){
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
          final picture = UserPicture(
        large: e['picture']['large'],
        medium: e['picture']['medium'],
        thumbnail: e['picture']['thumbnail']);

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

  }


  String get fullName {
    return '${username.title} ${username.first} ${username.last}';
  }
}
