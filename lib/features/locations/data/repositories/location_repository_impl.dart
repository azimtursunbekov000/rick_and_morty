import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';
import 'package:rick_and_morty/features/locations/domain/repositories/location_repository.dart';
import 'package:rick_and_morty/internal/helpers/api_requester.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

class LocationRepositoryImpl implements LocationRepository {
  ApiRequester apiRequester = ApiRequester();
  @override
  Future<LocationResult> getAllLocations() async {
    try {
      Response response = await apiRequester.toGet('api/location');

      log('getAllLocations result == ${response.data}');

      if (response.statusCode == 200) {
        return LocationResult.fromJson(response.data);
      }
      throw 'ощибка ${response.data}';
    } catch (e) {
      print('impl error $e');

      throw CatchException.convertException(e);
    }
  }
}
