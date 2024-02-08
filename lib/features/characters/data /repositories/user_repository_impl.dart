import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data%20/models/users_model.dart';
import 'package:rick_and_morty/features/characters/domain/presentation/user_repository.dart';

import 'package:rick_and_morty/internal/helpers/api_requester.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

@Injectable(as: UserRepository)
class UserRepositoriImpl implements UserRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<List<CharactersModel>> getAllCharacters() async {
    try {
      Response response = await apiRequester.toGet(apiRequester.url);

      log('getAllUsers result == ${response.data}');

      if (response.statusCode == 200) {
        return response.data
            .map<CharactersModel>((e) => CharactersModel.fromJson(e));
      }

      throw response;
    } catch (e) {
      // ignore: avoid_print
      print('impl ======= $e');

      throw CatchException.convertException(e);
    }
  }
}
