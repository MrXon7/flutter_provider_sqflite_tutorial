import 'package:flutter/material.dart';
import 'package:project1/provider_lesson/provider/counter_view.dart';
import 'package:provider/provider.dart';

class ProviderCounter extends StatelessWidget {
  const ProviderCounter({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Provider Counter")),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Tugma shuncha marta bosildi"),
          Text(
            "${context.watch<CounterViewModel>().count}",
            style: const TextStyle(fontSize: 28),
          ),
          IconButton(
              onPressed: () {
                context.read<CounterViewModel>().decrement();
              },
              icon: const Icon(Icons.remove))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterViewModel>().increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
