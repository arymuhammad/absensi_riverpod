import 'package:absensi_riverpod/src/features/login/view/login.dart';
import 'package:absensi_riverpod/src/features/profile/view/profile.dart';
import 'package:absensi_riverpod/src/global/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/view/home.dart';
import '../global/view/splash.dart';
part 'app_routes.dart';

final GoRouter router = GoRouter(
  
  initialLocation: RoutesPath.splash, routes: [
  GoRoute(
    path: RoutesPath.splash,
    builder: (BuildContext context, GoRouterState state) {
      return const SplashView();
    },
  ),
  GoRoute(
    path: RoutesPath.login,
    builder: (BuildContext context, GoRouterState state) {
      return Login();
    },
  ),
  GoRoute(
    path: RoutesPath.home,
    builder: (BuildContext context, GoRouterState state) {
      return const NavBar();
    },
  ),
  GoRoute(
    path: RoutesPath.home,
    builder: (BuildContext context, GoRouterState state) {
      return const Home();
    },
  ),
  GoRoute(
    path: RoutesPath.profile,
    builder: (BuildContext context, GoRouterState state) {
      return const Profile();
    },
  ),
]);
