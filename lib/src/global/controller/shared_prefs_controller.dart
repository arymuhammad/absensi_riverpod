import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user.dart';
import '../repository/shared_prefs_repo.dart';

final sharedPrefsControllerPovider = StateProvider((ref){
  final repo = ref.watch(sharedPrefsRepoProvider);
  return SharedPrefsController(repo: repo);
});


class SharedPrefsController {
  final SharedPrefsRepo _repo;

  SharedPrefsController({required SharedPrefsRepo repo}):_repo = repo;

  Future<String?> getCookie() async {
    return _repo.getCookie();
  }

  Future <void> setCookie({required String cookie}) async {
    await _repo.setCookie(cookie);
  }

  Future<User?> getUser() async {
    return _repo.getCurrentUser();
  }

  Future<void> setUser({required User user}) async {
    _repo.setCurrentUser(user);
  }

  Future<void> clear() async {
    return _repo.clear();
  }
}