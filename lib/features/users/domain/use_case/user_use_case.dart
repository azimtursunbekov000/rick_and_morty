import 'package:rick_and_morty/features/users/data%20/models/users_model.dart';
import 'package:rick_and_morty/features/users/domain/presentation/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<Characters> getAllUsers() async {
    return await userRepository.getAllCharacters();
  }
}
