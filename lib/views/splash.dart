import 'package:flutter/material.dart';
import 'package:todo_app/constant/appcolors.dart';
import 'package:todo_app/views/login.dart';

class Splash extends StatefulWidget {
  const new({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    onInItCalled();
    super.initState();
  }

  Future<void> onInItCalled()  async {
    await Future.delayed(Duration(seconds: 2));
    var route = MaterialPageRoute(builder: (context) => LogInPage());
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "MY TO-DO",
              style: TextStyle(color: AppColors.completedText, fontSize: 50),
            ),
            // Text("TO-DO", style: TextStyle(color: AppColors.primaryText, fontSize: 50)),
            CircularProgressIndicator(color: AppColors.taskCardBorderColor),
          ],  
        ),
      ),
    );
  }
}
