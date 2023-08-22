import 'package:bloc_prj/features/todos/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage>
    with AutomaticKeepAliveClientMixin {
  final TodoBloc todoBloc = TodoBloc();
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    todoBloc.add(TodoInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<TodoBloc, TodoState>(
      bloc: todoBloc,
      listenWhen: (previous, current) => current is TodoActionState,
      buildWhen: (previous, current) => current is! TodoActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case TodoFetchingLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case TodoFetchingSuccessfulState:
            final successState = state as TodoFetchingSuccessfulState;
            return Scaffold(
              body: Center(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: ListView.builder(
                    itemCount: successState.todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          successState.todos[index].title,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
