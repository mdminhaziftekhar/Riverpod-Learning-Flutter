import 'package:riverpod/riverpod.dart';

class CounterDemo extends StateNotifier<int> {
  CounterDemo() : super(0);

  void increment() {
    state++;
  }
}
