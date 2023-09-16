import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile(
      {super.key, required this.place, required this.ontapplacetile});

  final Place place;
  final void Function(BuildContext, Place) ontapplacetile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          ontapplacetile(context, place);
        },
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(place.image),
        ),
        title: Text(
          place.name,
        ));
  }
}
