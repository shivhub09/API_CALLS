class userLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocationTimeZoneCoordinate timezone;

  userLocation(
      {required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.street,
      required this.coordinates,
      required this.timezone});


      
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({required this.number, required this.name});
}

class LocationCoordinate {
  final String latitude;
  final String longitude; 
  LocationCoordinate({required this.latitude, required this.longitude});
}

class LocationTimeZoneCoordinate {
  final String offset;
  final String description;

  LocationTimeZoneCoordinate({required this.offset, required this.description});
}
