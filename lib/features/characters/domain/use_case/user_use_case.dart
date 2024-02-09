import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/characters/data/models/users_model.dart';
import 'package:rick_and_morty/features/characters/domain/presentation/user_repository.dart';

@injectable
class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<List<CharactersModel>> getAllCharacters() async {
    return await userRepository.getAllCharacters();
  }
}