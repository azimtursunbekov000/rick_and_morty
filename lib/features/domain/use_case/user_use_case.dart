import 'package:rick_and_morty/features/data%20/models/users_model.dart';
import 'package:rick_and_morty/features/domain/presentation/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<UserModel> getAllUsers() async {
    return await userRepository.getAllUsers();
  }
}
