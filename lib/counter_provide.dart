import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => Counter(),
        child: const MyApp(),
    )
  );
}

class Counter extends ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners(); // call at end of each function to update widgets
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) { // context allows access to above widgets in stack
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Demo")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Counter"),
            Consumer<Counter>(
                builder: (context, counter, child) => Text(
                  '${counter.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var counter = context.read<Counter>();
          counter.increment();
        },
        tooltip: 'Increment', // good for websites
        child: const Icon(Icons.add),
      ),
    );
  }
}