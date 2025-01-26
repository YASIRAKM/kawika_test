
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawika_machine_test/data/repos/comments_repository.dart';
import 'package:kawika_machine_test/presentation/comments/model/comments_model.dart';

final commentsProvider = AutoDisposeFutureProvider<List<CommentsModel>>(
  (ref) {
    return CommentsRepository.getComments();
  },
);
