import 'dart:io';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocation(
   { required this.latitude,
    required this.longitude,}
  ) : address = '14,Azad Road opp. jain temple sanawad';
}

class Place {
  final String id;
  final String name;
  final File image;
  final PlaceLocation location;

  /// initialiser list
  Place({
    required this.name,
    required this.image,
    required this.location,
    String? id
  }) : id = id?? uuid.v4();
}
