import 'package:network_bloc/models/user.dart';
import 'package:network_bloc/services/user_api_provider.dart';

class UserRepository {
  UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
