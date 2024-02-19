import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/characters_repository.dart';

import 'package:rick_and_morty/internal/helpers/api_requester.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

@Injectable(as: UserRepository)
class UserRepositoriImpl implements UserRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<CharactersResult> getAllCharacters() async {
    try {
      Response response = await apiRequester.toGet('api/character');
      if (response.statusCode == 200) {
        return CharactersResult.fromJson(response.data);
      }

      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
