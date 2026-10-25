import 'package:flutter/material.dart';
import 'package:todo_app/constant/appcolors.dart';

class ProfilePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Profile",
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          // color: Colors.white,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.appbarColor,
                child: Text(
                  "MSN",
                  style: TextStyle(color: AppColors.primaryText),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Muhammad Salman Nazeer",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              Text(
                "Semester-6 . Section-C",
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.taskCardBgColor,
                        border: BoxBorder.all(
                          width: 2,

                          color: AppColors.taskCardBorderColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "12",
                            style: TextStyle(color: AppColors.primaryText),
                          ),
                          Text(
                            "Quizzes",
                            style: TextStyle(color: AppColors.primaryText),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.taskCardBgColor,
                        border: BoxBorder.all(
                          width: 2,

                          color: AppColors.taskCardBorderColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "12",
                            style: TextStyle(color: AppColors.primaryText),
                          ),
                          Text(
                            "Quizzes",
                            style: TextStyle(color: AppColors.primaryText),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.taskCardBgColor,
                        border: BoxBorder.all(
                          width: 2,

                          color: AppColors.taskCardBorderColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "12",
                            style: TextStyle(color: AppColors.primaryText),
                          ),
                          Text(
                            "Quizzes",
                            style: TextStyle(color: AppColors.primaryText),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.taskCardBgColor,
                  border: Border.all(
                    width: 1,
                    color: AppColors.taskCardBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: AppColors.secondaryText,
                            size: 20,
                          ),
                          SizedBox(width: 12),
                          Text(
                            "Email",
                            style: TextStyle(color: AppColors.primaryText),
                          ),
                          Spacer(),
                          Text(
                            "salmannazeer.19500@gmail.com",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.red, endIndent: 10, indent: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.school,
                            color: AppColors.secondaryText,
                            size: 20,
                          ),
                          SizedBox(width: 12),
                          Text(
                            "Email",
                            style: TextStyle(color: AppColors.primaryText),
                          ),
                          Spacer(),
                          Text(
                            "salmannazeer.19500@gmail.com",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.red, endIndent: 10, indent: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_sharp,
                            color: AppColors.secondaryText,
                            size: 20,
                          ),
                          SizedBox(width: 12),
                          Text(
                            "Email",
                            style: TextStyle(color: AppColors.primaryText),
                          ),
                          Spacer(),
                          Text(
                            "salmannazeer.19500@gmail.com",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      // Divider(color: Colors.red, endIndent: 10, indent: 10),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.taskCardBgColor,
                  border: Border.all(
                    width: 1,
                    color: AppColors.taskCardBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Actions",
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Icon(
                          Icons.notifications_none_outlined,
                          color: AppColors.secondaryText,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Notifications",
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          color: AppColors.secondaryText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Icon(
                          Icons.logout_outlined,
                          color: AppColors.cancelIconColor,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Log out",
                          style: TextStyle(
                            color: AppColors.cancelIconColor,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
