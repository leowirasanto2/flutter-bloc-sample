import 'package:blocmwarrior/blocs/user_list/user_list_bloc.dart';
import 'package:blocmwarrior/views/add_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import '../pages/sliver_app_bar_page.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    final userListBloc = context.read<UserListBloc>();
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final name = user.name;
        final position = index + 1;
        final decoratedName = '$name - $position';
        return ListTile(
          onTap: () {
            const page = SliverAppBarExample();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => page));
          },
          title: Text(decoratedName),
          subtitle: Text(user.email),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    userListBloc.add(DeleteUser(user: user));
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {
                    // const newUser = User(name: 'Leo', id: 1, email: 'leo@leo.com');
                    // userListBloc.add(AddUser(user: newUser));
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 30,
                    color: Colors.green,
                  ))
            ],
          ),
        );
      },
    );
  }
}
