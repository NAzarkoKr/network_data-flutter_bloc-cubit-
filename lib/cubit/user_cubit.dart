import 'package:network_bloc/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_bloc/models/user.dart';
import 'package:network_bloc/services/user_repo.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository usersRepository;
  UserCubit(this.usersRepository) : super(UserEmptyState());

  Future<void> fetchUser() async {
    try {
      emit(UserLoadingState());
      final List<User> _loadedUserList = await usersRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: _loadedUserList));
    } catch (_) {}
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}
