import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/characters_repository.dart';

@injectable
class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<CharactersResult> getAllCharacters() async {
    return await userRepository.getAllCharacters();
  }
}
