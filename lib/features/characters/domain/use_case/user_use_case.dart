import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/users_model.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/user_repository.dart';

@injectable
class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<CharactersResult> getAllCharacters() async {
    return await userRepository.getAllCharacters();
  }
}
