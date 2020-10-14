import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_bloc/bloc/user_event.dart';
import 'package:network_bloc/bloc/user_state.dart';
import 'package:network_bloc/models/user.dart';
import 'package:network_bloc/services/user_repo.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository usersRepository;
  UserBloc(this.usersRepository) : super(UserEmptyState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<User> _loadedUserList = await usersRepository.getAllUsers();

        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield UserEmptyState();
      }
    } else if (event is UserClearEvent) {
      yield UserEmptyState();
    }
  }
}

//class UserBloc extends Bloc<UserEvent, //UserState> {
//  final UserRepository usersRepository;

//   UserBloc({this.usersRepository}) : assert(usersRepository != null);

//   @override
//   UserState get initialState => UserEmptyState();

//   @override
//   Stream<UserState> mapEventToState(UserEvent event) async* {
//     if (event is UserLoadEvent) {
//       yield UserLoadingState();
//       try {
//         final List<User> _loadedUserList = await usersRepository.getAllUsers();

//         yield UserLoadedState(loadedUser: _loadedUserList);
//       } catch (_) {
//         yield UserEmptyState();
//       }
//     } else if (event is UserClearEvent) {
//       yield UserEmptyState();
//     }
//   }
// }
