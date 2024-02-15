import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';

class LocationDetailScreen extends StatelessWidget {
  final LocationModel locationModel;
  const LocationDetailScreen({
    super.key,
    required this.locationModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
