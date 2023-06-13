import 'package:firebase_chat_example/features/chat/view/chat_room_list_screen.dart';
import 'package:firebase_chat_example/features/chat/view/chat_room_screen.dart';
import 'package:firebase_chat_example/features/user/view/profile_screen.dart';
import 'package:firebase_chat_example/features/user/view/user_list_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'scaffold_with_bottom_nav_bar.dart';

final rootNavigatorKey = Provider((ref) => GlobalKey<NavigatorState>());
final shellNavigatorKey = Provider((ref) => GlobalKey<NavigatorState>());
final routerProvider = Provider(
  (ref) {
    return GoRouter(
      navigatorKey: ref.watch(rootNavigatorKey),
      initialLocation: '/UserList',
      routes: [
        ShellRoute(
          navigatorKey: ref.watch(shellNavigatorKey),
          builder: (context, state, child) => ScaffoldWithBottomNavBar(
            child: child,
          ),
          routes: [
            GoRoute(
              path: '/UserList',
              name: UserListScreen.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: UserListScreen(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: ref.watch(rootNavigatorKey),
                  path: 'ChatRoom/:userId',
                  name: ChatRoomScreen.routeName,
                  builder: (context, state) {
                    final userId = state.pathParameters['userId']!;
                    return ChatRoomScreen(userId: userId);
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/ChatRoomList',
              name: ChatRoomListScreen.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ChatRoomListScreen(),
              ),
            ),
            GoRoute(
              path: '/Profile',
              name: ProfileScreen.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfileScreen(),
              ),
            ),
          ],
        )
      ],
    );
  },
);
