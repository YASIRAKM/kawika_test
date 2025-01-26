import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawika_machine_test/core/services/shared_pref_helper.dart';
import 'package:kawika_machine_test/data/repos/auth_repository.dart';

class AuthNotifier extends AutoDisposeAsyncNotifier<AuthState> {
  @override
  FutureOr<AuthState> build() {
    return AuthState(isAuthenticated: false);
  }

  Future<void> login(
      {required String username, required String password}) async {
    state = AsyncValue.loading();

    try {
      state = await AsyncValue.guard(
        () async {
          final (bool, String) res = await AuthRepository.login(
              username: username, password: password);
          if (res.$1) {
            return AuthState(isAuthenticated: true);
          } else {
            return AuthState(isAuthenticated: false, message: res.$2);
          }
        },
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<bool> logout() async {
    try {
      bool res = await SharedPrefHelper.removeValue("user");
      bool clearStaorage = await SharedPrefHelper.clearStorage();
      if (res && clearStaorage) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

final authNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AuthNotifier, AuthState>(
  () {
    return AuthNotifier();
  },
);

class AuthState {
  final bool isAuthenticated;
  final String? message;

  AuthState({required this.isAuthenticated, this.message});
}
