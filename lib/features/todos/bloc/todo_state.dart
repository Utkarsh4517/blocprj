// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

abstract class TodoActionState extends TodoState {}

class TodoInitial extends TodoState {}

class TodoFetchingLoadingState extends TodoState {}

class TodoFetchingErrorState extends TodoState {}




class TodoFetchingSuccessfulState extends TodoState {
  final List<TodoModel> todos;
  TodoFetchingSuccessfulState({
    required this.todos,
  });
}
