import 'package:absensi_riverpod/src/features/login/view/login.dart';
import 'package:absensi_riverpod/src/features/profile/view/profile.dart';
import 'package:absensi_riverpod/src/features/stock/view/cek_stock.dart';
import 'package:absensi_riverpod/src/global/view/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/home/view/home.dart';
import '../global/view/splash.dart';
part 'app_routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routeProvider = Provider<GoRouter>((ref) {
  final loggedIn = ref.watch(loggedInProvider);
  return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: RoutesPath.splash,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: RoutesPath.splash,
          name: 'splash',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashView();
          },
        ),
        GoRoute(
          path: RoutesPath.login,
          name: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginView();
          },
        ),
        GoRoute(
            path: RoutesPath.navbar,
            name: 'navbar',
            builder: (BuildContext context, GoRouterState state) {
              return const NavBar();
            },
            routes: [
              GoRoute(
                  path: RoutesPath.stock,
                  name: 'cekstock',
                  builder: (context, state) {
                    return const CekStock();
                  }),
              GoRoute(
                path: RoutesPath.profile,
                name: 'profile',
                builder: (context, state) {
                  return const Profile();
                },
              ),
            ]),
        GoRoute(
          path: RoutesPath.home,
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
        ),
      ],
      redirect: ((context, state) {
        final loggingIn = state.uri.path == RoutesPath.login;
        if (loggedIn) {
          if (loggingIn) return null;
          return RoutesPath.navbar;
        }
        if (loggingIn) return RoutesPath.login;
        return null;
      }));
});

final loggedInProvider = StateProvider<bool>((ref) => false);
