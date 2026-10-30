import 'package:flutter/material.dart';
// import 'package:todo_app/views/homepage.dart';
// import 'package:todo_app/views/example.dart';
// import 'package:todo_app/views/homepage.dart';
// import 'package:todo_app/views/profile.dart';
import 'package:todo_app/views/splash.dart';
// import 'package:todo_app/views/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // home: const ProfilePage(),
      home: const Splash(),
      // home: const Example(),
      // home: const HomePage(),
      // home: const LogInPage(),
    );
  }
}
