import 'package:firebase_chat_example/features/chat/view/chat_room_list_screen.dart';
import 'package:firebase_chat_example/features/user/view/profile_screen.dart';
import 'package:firebase_chat_example/features/user/view/user_list_screen.dart';
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
          NavigationDestination(icon: Icon(Icons.person_search), label: ''),
          NavigationDestination(icon: Icon(Icons.chat), label: ''),
          NavigationDestination(icon: Icon(Icons.account_circle), label: ''),
        ],
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              _selectedIndex = 0;
              context.goNamed(UserListScreen.routeName);
            case 1:
              _selectedIndex = 1;
              context.goNamed(ChatRoomListScreen.routeName);
            case 2:
              _selectedIndex = 2;
              context.goNamed(ProfileScreen.routeName);
            default:
              _selectedIndex = 0;
              context.goNamed(UserListScreen.routeName);
          }
          setState(() {});
        },
      ),
      body: widget.child,
    );
  }
}
