import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_learning/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Consumer(
            builder: ((context, ref, child) {
              final name = ref.watch(nameProvider);
              return Text(name);
            }),
          ),
        ),
      ),
    );
  }
}

class HomeStateful extends ConsumerStatefulWidget {
  const HomeStateful({super.key});

  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends ConsumerState<HomeStateful> {
  @override
  void initState() {
    final name = ref.read(nameProvider);
    super.initState();
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
