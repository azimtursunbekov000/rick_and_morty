import 'package:rick_and_morty/features/data%20/models/users_model.dart';

abstract class UserRepository {
  ///RU: получение информацию всех пользователей
  ///
  ///EN:getting the information of all users

  Future<UserModel> getAllUsers();
}
