part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}


class TodoInitialFetchEvent extends TodoEvent {}

