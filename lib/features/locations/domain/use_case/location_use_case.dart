import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';
import 'package:rick_and_morty/features/locations/data/repositories/location_repository_impl.dart';
import 'package:rick_and_morty/features/locations/domain/repositories/location_repository.dart';

@injectable
class LocationUseCase {
  final LocationRepositoryImpl locationRepositoryImpl =
      LocationRepositoryImpl();
  final LocationRepository locationRepository;

  LocationUseCase({required this.locationRepository});

  Future<LocationResult> getAllLocations() async {
    return await locationRepository.getAllLocations();
  }

  Future<List<CharacterModel>> getResident(LocationModel model) async =>
      await locationRepository.getResidents(model);
}
