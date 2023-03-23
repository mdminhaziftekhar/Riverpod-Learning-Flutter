import 'package:riverpod/riverpod.dart';
import 'package:riverpod_learning/model/user_model.dart';
import 'package:riverpod_learning/providers/counter_demo.dart';
import 'package:riverpod_learning/services/api_service.dart';

final nameProvider = Provider<String>((ref) {
  return 'Minhaz welcome to Eigooo';
});

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

final counterStateNotifierProvider =
    StateNotifierProvider<CounterDemo, int>((ref) {
  return CounterDemo();
});

final apiProvider = Provider<ApiService>(
  (ref) => ApiService(),
);

final userDataProvider =
    FutureProvider<List<UserModel>>((ref) => ref.read(apiProvider).getUser());

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 2),
    (((computationCount) => computationCount)),
  );
});
