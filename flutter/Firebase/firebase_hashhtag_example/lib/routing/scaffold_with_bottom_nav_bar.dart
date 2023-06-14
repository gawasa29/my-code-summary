import 'package:firebase_hashhtag_example/features/post/view/time_line_screen.dart';
import 'package:firebase_hashhtag_example/features/search/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({required this.child, super.key});

  final Widget child;
  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: ''),
          NavigationDestination(icon: Icon(Icons.search), label: ''),
        ],
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              _selectedIndex = 0;
              context.goNamed(TimeLineScreen.routeName);
            case 1:
              _selectedIndex = 1;
              context.goNamed(SearchScreen.routeName);

            default:
              _selectedIndex = 0;
              context.goNamed(SearchScreen.routeName);
          }
          setState(() {});
        },
      ),
      body: widget.child,
    );
  }
}
