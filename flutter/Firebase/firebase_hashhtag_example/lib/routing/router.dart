import 'package:firebase_hashhtag_example/features/post/view/add_post_screen.dart';
import 'package:firebase_hashhtag_example/features/post/view/time_line_screen.dart';
import 'package:firebase_hashhtag_example/features/search/view/search_screen.dart';
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
      initialLocation: '/TimeLine',
      routes: [
        ShellRoute(
          navigatorKey: ref.watch(shellNavigatorKey),
          builder: (context, state, child) => ScaffoldWithBottomNavBar(
            child: child,
          ),
          routes: [
            GoRoute(
              path: '/TimeLine',
              name: TimeLineScreen.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: TimeLineScreen(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: ref.watch(rootNavigatorKey),
                  path: 'AddPost',
                  name: AddPostScreen.routeName,
                  builder: (context, state) => const AddPostScreen(),
                ),
              ],
            ),
            GoRoute(
              path: '/Search',
              name: SearchScreen.routeName,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SearchScreen(),
              ),
            ),
          ],
        )
      ],
    );
  },
);
