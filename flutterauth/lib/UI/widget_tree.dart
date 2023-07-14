import 'package:flutter/material.dart';
import 'package:flutterauth/UI/content/main_screen.dart';
import 'package:flutterauth/UI/content/spalsh_screen.dart';
import 'package:flutterauth/data/api/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MainPage();
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
