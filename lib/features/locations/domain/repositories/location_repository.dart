import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';

abstract class LocationRepository {
  ///RU: получение информацию всех локаций
  ///
  ///EN:getting the information of all locations

  Future<LocationResult> getAllLocations();

  ///RU: получение информацию о резидентах
  ///
  ///EN:getting information about residents
  Future<List<CharactersResult>> getResidents(LocationModel locationResidents);
}
