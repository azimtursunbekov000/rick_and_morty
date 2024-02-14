import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';

abstract class LocationRepository {
  ///RU: получение информацию всех локаций
  ///
  ///EN:getting the information of all locations

  Future<LocationResult> getAllLocations();
}
