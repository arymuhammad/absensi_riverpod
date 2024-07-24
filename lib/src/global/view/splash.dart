import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_config.dart';
import '../../routes/app_pages.dart';
import '../controller/init_controller.dart';
import '../providers/common_providers.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();

    /// check if the app is running in dev mode
    if (AppConfig.devMode) {
      /// bypass authenticaion logic.
      /// Navigate to Home
      Future.delayed(const Duration(seconds: 2)).then((value) {
        context.go(RoutesPath.home);
      });
    } else {
      ref.read(initControllerProvider).initUserAndToken().then((value) {
        final user = ref.watch(currentUserProvider);
        final token = ref.watch(authTokenProvider);

        /// Check if both the [user] and [token] have value
        if (user == null || token == null) {
          // print(user == null);
          // print(token == null);
          Future.delayed(const Duration(seconds: 2)).then((value) {
            /// Route the user to Authenticaion screen
            context.go(RoutesPath.login);
          });
        } else {
          /// Route the user to Home screen         
          context.go(RoutesPath.navbar);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Splash",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}