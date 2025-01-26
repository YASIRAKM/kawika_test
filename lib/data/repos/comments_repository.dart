import 'package:kawika_machine_test/data/api/api_endpoints.dart';
import 'package:kawika_machine_test/presentation/comments/model/comments_model.dart';
import 'package:http/http.dart' as http;

class CommentsRepository {
  static Future<List<CommentsModel>> getComments() async {
    try {
      final res = await http.get(Uri.parse(ApiEndpoints.commentsUrl));
      if (res.statusCode == 200) {
        return commentsModelFromJson(res.body);
      } else {
        throw Exception("failed to fetch comments");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
