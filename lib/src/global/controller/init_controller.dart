import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/common_providers.dart';
import 'shared_prefs_controller.dart';

final initControllerProvider = Provider((ref) => InitController(ref: ref));

class InitController {
  final Ref _ref;

  InitController({required Ref ref}): _ref = ref;

  Future <void> initUserAndToken() async {
    await _ref.watch(sharedPrefsControllerPovider).getUser().then((value){
      _ref.watch(currentUserProvider.notifier).update((state) => value);
    });

    await _ref.watch(sharedPrefsControllerPovider).getCookie().then((value){
      _ref.watch(authTokenProvider.notifier).update((state) => value);
    });
  }
}