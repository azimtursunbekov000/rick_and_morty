import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';
import 'package:rick_and_morty/features/locations/domain/repositories/location_repository.dart';
import 'package:rick_and_morty/internal/helpers/api_requester.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  ApiRequester apiRequester = ApiRequester();
  @override
  Future<LocationResult> getAllLocations() async {
    try {
      Response response = await apiRequester.toGet('api/location');

      log('getAllLocations result == ${response.data}');

      if (response.statusCode == 200) {
        // var respons = LocationResult.fromJson(response.data);
        // for (int i = 0; i <= respons.results![0].residents!.length; i++) {
        //   Response response =
        //       await apiRequester.toGet(respons.results![0].residents![i]);
        // }
      }
      throw 'ощибка ${response.data}';
    } catch (e) {
      print('impl error $e');

      throw CatchException.convertException(e);
    }
  }
}
