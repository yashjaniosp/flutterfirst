// import 'package:auth/UI/content/test_main_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const TestScreen(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await FirebaseAuth.instance
// //       .signInAnonymously(); // Sign in anonymously for demonstration purposes
// //   runApp(MyApp());
// // }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'User Email Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('User Email Demo'),
//         ),
//         body: const Center(
//           child: UserEmailWidget(),
//         ),
//       ),
//     );
//   }
// }

// class UserEmailWidget extends StatefulWidget {
//   const UserEmailWidget({super.key});

//   @override
//   _UserEmailWidgetState createState() => _UserEmailWidgetState();
// }

// class _UserEmailWidgetState extends State<UserEmailWidget> {
//   String userEmail = '';

//   @override
//   void initState() {
//     super.initState();
//     printCurrentUserEmail();
//   }

//   Future<void> printCurrentUserEmail() async {
//     User? currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       setState(() {
//         userEmail = currentUser.email ?? '';
//       });
//       print('Current user email: $userEmail');
//     } else {
//       print('No user is currently signed in.');
//       print("${currentUser?.email} NO USER EMAIL IS THERE");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Current User Email: $userEmail',
//       style: const TextStyle(fontSize: 18),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Credentials Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Credentials Demo'),
        ),
        body: Center(
          child: UserCredentialsWidget(),
        ),
      ),
    );
  }
}

class UserCredentialsWidget extends StatefulWidget {
  @override
  _UserCredentialsWidgetState createState() => _UserCredentialsWidgetState();
}

class _UserCredentialsWidgetState extends State<UserCredentialsWidget> {
  User? currentUser;

  @override
  void initState() {
    super.initState();
    retrieveUserCredentials();
  }

  Future<void> retrieveUserCredentials() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('User Email: ${currentUser?.email}'),
          Text('User Display Name: ${currentUser?.displayName ?? 'N/A'}'),
          Text('User UID: ${currentUser?.uid}'),
          // Add more credential properties as needed
        ],
      );
    } else {
      return const CircularProgressIndicator(); // Show a loading indicator while credentials are being retrieved
    }
  }
}
