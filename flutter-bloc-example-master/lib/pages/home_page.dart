import 'package:blocmwarrior/blocs/user_list/user_list_bloc.dart';
import 'package:blocmwarrior/models/user.dart';
import 'package:blocmwarrior/views/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/add_user_widget.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('CRUD using bloc'),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<UserListBloc>().add(
                        AddUser(
                          user: const User(
                            name: 'Leo',
                            id: 1,
                            email: 'leo@leo.com',
                          ),
                        ),
                      );
                },
                icon: const Icon(
                  Icons.add,
                  size: 24,
                  color: Colors.red,
                )),
          ],
        ),
        body: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            if (state.users.isEmpty) {
              return const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text('No User, please add'),
                ),
              );
            } else {
              return UserTile(users: state.users);
            }
          },
        ),
      );
}
