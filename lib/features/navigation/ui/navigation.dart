import 'package:bloc_prj/features/home/ui/home.dart';
import 'package:bloc_prj/features/navigation/bloc/bloc/navigation_bloc.dart';
import 'package:bloc_prj/features/todos/ui/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavItems =
        const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.grid_3x3),
        label: 'Category',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline),
        label: 'Favourite',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined),
        label: 'Cart',
      ),
    ];

    const List<Widget> bottomNavScreen = <Widget>[
      HomePage(),
      TodoPage(),
      Text('Index 2: Search'),
      Text('Index 3: Favourite'),
      Text('Index 4: Cart'),
    ];

    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              context
                  .read<NavigationBloc>()
                  .add(TabChangeEvent(tabIndex: index));
            },
            children: bottomNavScreen,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          ),
        );
      },
    );
  }
}
