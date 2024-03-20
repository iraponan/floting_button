import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platform = MethodChannel('floating_button');

  int count = 0;

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler((call) {
      if (call.method == 'touch') {
        setState(() {
          count += 1;
        });
      }
      return Future(() => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Button Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '$count',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                platform.invokeListMethod('create');
              },
              child: const Text('Create'),
            ),
            ElevatedButton(
              onPressed: () {
                platform.invokeListMethod('show');
              },
              child: const Text('Show'),
            ),
            ElevatedButton(
              onPressed: () {
                platform.invokeListMethod('hide');
              },
              child: const Text('Hide'),
            ),
            ElevatedButton(
              onPressed: () {
                platform.invokeMethod('isShowing').then((isShowing) => print(isShowing));
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
