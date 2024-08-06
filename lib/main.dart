import 'package:absensi_riverpod/src/global/util/loger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/config/const.dart';
import 'src/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // await Workmanager().initialize(callbackDispatcher);
  await initializeDateFormatting('id_ID', "");
  runApp(ProviderScope(observers: [Logger()], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'URBAN&CO SPOT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        useMaterial3: false,
        primaryColor: white,
        canvasColor: const Color.fromARGB(255, 209, 213, 219),
        fontFamily: 'Nunito',
      ),
      // routeInformationParser: router.routeInformationParser,
      // routerDelegate: router.routerDelegate,
      // routeInformationProvider: router.routeInformationProvider,
      routerConfig: router,
    );
  }
}
