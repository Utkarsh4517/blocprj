import 'package:bloc_prj/features/navigation/bloc/bloc/navigation_bloc.dart';
import 'package:bloc_prj/features/navigation/ui/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  final NavigationBloc navigationBloc = NavigationBloc();
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NavigationBloc>.value(
            value: navigationBloc,
            child: const NavigationWidget(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(child: Text('Error')),
      );
    });
  }
}
