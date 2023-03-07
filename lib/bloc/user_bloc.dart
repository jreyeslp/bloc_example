import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import '../model/user.dart';

abstract class UsersEvent {}

class GetUsersEvent extends UsersEvent {}

class UserBloc extends Bloc<UsersEvent, List<User>> {
  final Dio dio;

  UserBloc({required this.dio}) : super([]) {
    on<GetUsersEvent>((event, emit) async {
      final users = await fetchUserList();

      emit(users);
    });
  }

  Future<List<User>> fetchUserList() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      final List<User> users = (response.data as List).map((userJson) {
        return User(
          name: userJson['name'],
          email: userJson['email'],
        );
      }).toList();
      return users;
    } catch (error) {
      debugPrint(error.toString());
      return [];
    }
  }
}
