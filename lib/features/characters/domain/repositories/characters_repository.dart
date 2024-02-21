import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';

abstract class UserRepository {
  ///RU: получение информацию всех пользователей
  ///
  ///EN: getting the information of all users
  Future<CharactersResult> getAllCharacters();
}
