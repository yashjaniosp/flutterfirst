import 'package:flutter/material.dart';
import 'package:flutterauth/data/api/auth.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test App"),
        ),
        body: ElevatedButton(
          onPressed: () {
            print(Auth().currentUser!.email.toString());
          },
          child: const Text("Click"),
        )
        // Column(
        //   children: [
        //     // Text(Auth().currentUser!.email.toString()),
        //   ],
        // ),
        );
  }
}
