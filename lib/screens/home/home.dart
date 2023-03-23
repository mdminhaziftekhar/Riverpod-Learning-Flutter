import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_learning/main.dart';
import 'package:riverpod_learning/providers/provider.dart';

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
  ConsumerState<HomeStateful> createState() => _HomeStatefulState();
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
    //final count = ref.watch(counterProvider);

    final counter = ref.watch(counterStateNotifierProvider);

    ref.listen(counterStateNotifierProvider, ((previous, next) {
      if (next == 5) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('The value is $next'),
        ));
      }
    }));

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
        actions: [
          IconButton(
            onPressed: () {
              //ref.invalidate(counterProvider);
              ref.refresh(counterStateNotifierProvider);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ref.read(counterProvider.notifier).update((state) => state + 1);
          ref.read(counterStateNotifierProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
