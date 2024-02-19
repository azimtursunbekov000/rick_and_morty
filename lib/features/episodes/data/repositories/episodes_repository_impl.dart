// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/episodes/data/models/episodes_model.dart';
import 'package:rick_and_morty/features/episodes/domain/repositories/episodes_repository.dart';
import 'package:rick_and_morty/internal/helpers/api_requester.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

@Injectable(as: EpisodesRepository)
class EpisodesRepositoryImpl implements EpisodesRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<EpisodesResult> getAllEpisodes() async {
    try {
      Response response = await apiRequester.toGet('api/episode');
      log('getAllEpisodes result == ${response.data}');

      if (response.statusCode == 200) {
        return EpisodesResult.fromJson(response.data);
      }
      throw 'error $response';
    } catch (e) {
      print('impl error == $e');
      throw CatchException.convertException(e);
    }
  }
}
