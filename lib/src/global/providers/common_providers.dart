import 'package:absensi_riverpod/src/model/login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// Watch the [authTokenProvider] to check if the user is logged in.
final authTokenProvider = StateProvider<String?>((ref) => null);

final currentUserProvider = StateProvider<Data?>((ref) => null);

final isAuthProvider = StateProvider<bool?>((ref) => false);
