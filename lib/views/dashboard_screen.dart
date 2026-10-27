import 'package:flutter/material.dart';
import 'package:todo_app/constant/appcolors.dart';
import 'package:todo_app/views/homepage.dart';
import 'package:todo_app/views/profile.dart';

class DashboardScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> myScreenList = [HomePage(), ProfilePage()];

  int myScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreenList[myScreenIndex],

      backgroundColor: AppColors.bgColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          myScreenIndex = index;
          setState(() {});
        },
        backgroundColor: AppColors.appbarColor,
        selectedItemColor: AppColors.primaryText,
        unselectedItemColor: AppColors.cancelIconColor,
        selectedLabelStyle: TextStyle(fontSize: 17),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
