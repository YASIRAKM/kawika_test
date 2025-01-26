import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawika_machine_test/core/services/shared_pref_helper.dart';
import 'package:kawika_machine_test/presentation/auth/model/user_model.dart';

class ProfileNotifier extends AutoDisposeAsyncNotifier<UserModel> {
  @override
  FutureOr<UserModel> build() async {
    return await getuser();
  }

  Future<UserModel> getuser() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      String? userData = await SharedPrefHelper.getValue("user");
      if (userData != null) {
        return userModelFromJson(userData);
      } else {
        state = AsyncValue.error("User not found", StackTrace.current);
        throw Exception("User not found");
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      throw Exception(e);
    }
  }
}

final profileProvider =
    AutoDisposeAsyncNotifierProvider<ProfileNotifier, UserModel>(
  () => ProfileNotifier(),
);
