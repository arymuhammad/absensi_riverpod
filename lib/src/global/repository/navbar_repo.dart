import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarRepo extends StateNotifier<int> {
  NavBarRepo() : super(0);
  void selectedNav(int index) => state = index;
}

final navBarRepoProvider = StateNotifierProvider<NavBarRepo, int>((ref) => NavBarRepo());