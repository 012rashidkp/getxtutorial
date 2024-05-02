
import 'package:flutter/cupertino.dart';
import 'package:getxexample/Presentation/Screens/responsivescreen.dart';
import 'package:getxexample/Routes/routeNames.dart';

import 'package:getxexample/Utility/constants.dart';
import 'package:go_router/go_router.dart';

import '../Presentation/Screens/apiscreen.dart';
import '../Presentation/Screens/hivescreen.dart';
import '../Presentation/Screens/homescreen.dart';
import '../Presentation/Screens/paginationscreen.dart';
import '../Presentation/Screens/sqflitescreen.dart';

final router = GoRouter(
    initialLocation: home,
    navigatorKey: GlobalKey<NavigatorState>(), // Add a GlobalKey for the navigator
    routes:[
        GoRoute(
            name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
            path: home,
            builder: (context, state) =>const HomeScreen(),
        ),
      GoRoute(
        name: 'hive', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: hive,
        builder: (context, state) =>const HiveScreen(),
      ),
      GoRoute(
        name: 'sqflite', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: sqflite,
        builder: (context, state) =>const SqFlitScreen(),
      ),
      GoRoute(
        name: 'api', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: api,
        builder: (context, state) =>const ApiScreen(),
      ),
      GoRoute(
        name: 'pagination', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: pagination,
        builder: (context, state) =>const PaginationScreen(),
      ),
      GoRoute(
        name: 'responsive', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: responsive,
        builder: (context, state) =>const ResponsiveScreen(),
      ),

    ]

);