// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/users_model.dart';
import 'package:rick_and_morty/features/characters/domain/presentation/user_repository.dart';

import 'package:rick_and_morty/internal/helpers/api_requester.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

@Injectable(as: UserRepository)
class UserRepositoriImpl implements UserRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<CharactersResult> getAllCharacters() async {
    try {
      Response response = await apiRequester.toGet('api/character');
      // var dd ='{"info": { "count": 826,"pages": 42,"next": "https://rickandmortyapi.com/api/character?page=2","prev": null}}';
      // var dd = '{"info": {"count": 826}}';
      log('getAllCharacters result == ${response.data}');

      if (response.statusCode == 200) {
        return CharactersResult.fromJson(response.data);
      }

      throw response;
    } catch (e) {
      print('impl ======= $e');

      throw CatchException.convertException(e);
    }
  }
}
