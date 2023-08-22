// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_prj/features/todos/models/todo_models.dart';
import 'package:bloc_prj/features/todos/repos/tood_repo.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoInitialFetchEvent>(todoInitialFetchEvent);
  }

  FutureOr<void> todoInitialFetchEvent(
      TodoInitialFetchEvent event, Emitter<TodoState> emit) async {
    emit(TodoFetchingLoadingState());
    List<TodoModel> todos = await TodoRepo.fetchTodos();
    emit(TodoFetchingSuccessfulState(todos: todos));
  }
}
