import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:favorite_places/widgets/place_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;
  _tapOnAddPlace(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return const AddPlace();
    }));
  }

  _tapOnPlaceTile(BuildContext context, Place place) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return PlaceDetailsScreen(place: place);
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    _placesFuture = ref.read(userPlacesProvider.notifier).loadPlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final placesList = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
              onPressed: () {
                _tapOnAddPlace(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: _placesFuture,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: placesList.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (BuildContext context, int index) {
                      return PlaceTile(
                        place: placesList[index],
                        ontapplacetile: _tapOnPlaceTile,
                      );
                    },
                  ),
      ),
    );
  }
}
