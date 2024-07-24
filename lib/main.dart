import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config/const.dart';
import 'src/routes/app_pages.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'URBAN&CO SPOT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
        primaryColor: white,
        canvasColor: const Color.fromARGB(255, 209, 213, 219),
        fontFamily: 'Nunito',
      ),
      routerConfig: router,
    );
  }
}
