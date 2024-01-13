import 'package:blocmwarrior/blocs/user_list/user_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';

class AddUserWidget extends StatelessWidget {
  const AddUserWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final userListBloc = context.read<UserListBloc>();
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ElevatedButton(
        onPressed: () {
          userListBloc.add(AddUser(user: user));
        },
        child: const Text('Add User'),
      ),
    );
  }
}
