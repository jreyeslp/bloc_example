import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../bloc/user_bloc.dart';
import '../pages/user_list.dart';

void main() {
  final Dio dio = Dio();
  runApp(App(dio: dio));
}

class App extends StatelessWidget {
  final Dio dio;

  const App({super.key, required this.dio});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BLoC Example',
      home: BlocProvider(
        create: (BuildContext context) =>
            UserBloc(dio: dio)..add(GetUsersEvent()),
        child: const UserList(),
      ),
    );
  }
}
