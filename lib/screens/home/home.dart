import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_learning/main.dart';
import 'package:riverpod_learning/providers/provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: streamData.when(
        data: (data) => Center(
          child: Text(
            data.toString(),
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        error: ((error, stackTrace) => Text(error.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(),
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

    final userData = ref.watch(userDataProvider);

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
      body: userData.when(data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${data[index].firstName} ${data[index].lastName}'),
              subtitle: Text(data[index].email),
              leading: CircleAvatar(
                child: Image.network(data[index].avatar),
              ),
            );
          },
        );
      }, error: (error, stackTree) {
        return Text(error.toString());
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),

      // body: Center(
      //   child: Text(
      //     '$counter',
      //     style: TextStyle(fontSize: 30),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     //ref.read(counterProvider.notifier).update((state) => state + 1);
      //     ref.read(counterStateNotifierProvider.notifier).increment();
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
