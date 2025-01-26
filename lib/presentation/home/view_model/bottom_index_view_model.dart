import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomIndexProvider = AutoDisposeStateProvider<int>(
  (ref) => 0,
);
