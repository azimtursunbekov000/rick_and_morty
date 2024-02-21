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
  Future<List<CharacterModel>> getResidents(LocationModel locationModel) async {
    List<CharacterModel> residentModelList = [];
    try {
      for (var element in locationModel.residents ?? []) {
        Response response = await apiRequester
            .toGet('api/character/${element.replaceAll(RegExp('[^0-9]'), "")}');
            
        residentModelList.add(CharacterModel.fromJson(response.data));
      }
      log("=" * 20);
      log(residentModelList.toString());
      return residentModelList;
    } catch (e) {
      print("error == $e");
      throw CatchException.convertException(e);
    }
  }
}
