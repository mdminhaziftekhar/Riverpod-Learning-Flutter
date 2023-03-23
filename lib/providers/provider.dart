import 'package:riverpod/riverpod.dart';
import 'package:riverpod_learning/providers/counter_demo.dart';

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
