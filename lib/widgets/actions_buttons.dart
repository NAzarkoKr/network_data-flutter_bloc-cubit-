import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_bloc/bloc/user_bloc.dart';
import 'package:network_bloc/bloc/user_event.dart';
import 'package:network_bloc/cubit/user_cubit.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final UserCubit userCubit = context.bloc<UserCubit>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            userCubit.fetchUser();
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: () {
            userCubit.clearUsers();
          },
          color: Colors.red,
        ),
      ],
    );
  }
}
