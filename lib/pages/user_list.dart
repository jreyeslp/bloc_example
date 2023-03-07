import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../model/user.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: BlocBuilder<UserBloc, List<User>>(
        builder: (context, userList) {
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(userList[index].name),
                subtitle: Text(userList[index].email),
              );
            },
          );
        },
      ),
    );
  }
}
