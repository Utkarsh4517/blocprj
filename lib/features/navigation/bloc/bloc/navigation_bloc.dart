// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial(tabIndex: 0)) {
    on<TabChangeEvent>(tabChangeEvent);
  }

  FutureOr<void> tabChangeEvent(
      TabChangeEvent event, Emitter<NavigationState> emit) {
    print(event.tabIndex);
    emit(NavigationInitial(tabIndex: event.tabIndex));
  }
}
