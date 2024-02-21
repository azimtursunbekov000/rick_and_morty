// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
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
        return LocationResult.fromJson(response.data);
      }
      throw 'ощибка ${response.data}';
    } catch (e) {
      print('impl error $e');

      throw CatchException.convertException(e);
    }
  }

  @override
  Future<List<CharactersResult>> getResidents(
      LocationModel locationResidents) async {
    try {
      List<CharactersResult> residentModelList = [];
      for (var element in locationResidents.residents!) {
        Response response =
            await apiRequester.toGet('character/${element.substring(42)}');
        residentModelList.add(CharactersResult.fromJson(response.data));
      }
      return residentModelList;
    } catch (e) {
      print("error == $e");
      throw CatchException.convertException(e);
    }
  }
}
