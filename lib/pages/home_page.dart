import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_bloc/bloc/user_bloc.dart';
import 'package:network_bloc/cubit/user_cubit.dart';
import 'package:network_bloc/services/user_repo.dart';
import 'package:network_bloc/widgets/actions_buttons.dart';
import 'package:network_bloc/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Users List"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
