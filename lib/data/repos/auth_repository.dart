import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kawika_machine_test/core/services/shared_pref_helper.dart';
import 'package:kawika_machine_test/data/api/api_endpoints.dart';
import 'package:kawika_machine_test/presentation/auth/model/user_model.dart';

class AuthRepository {
  static Future<(bool, String)> login(
      {required String username, required String password}) async {
    try {
      final Map<String, dynamic> params = {
        "username": username,
        "password": password
      };
      final res =
          await http.post(Uri.parse(ApiEndpoints.loginUrl), body: params);
      if (res.statusCode == 200) {
        UserModel user = userModelFromJson(res.body);

        bool saveUser =
            await SharedPrefHelper.saveUser("user", userModelToJson(user));

        if (saveUser) {
          return (true, "login success");
        } else {
          return (false, "failed to login");
        }
      } else {
        var body = jsonDecode(res.body);
        return (false, body["message"] as String);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
