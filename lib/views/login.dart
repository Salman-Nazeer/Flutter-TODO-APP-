import 'package:flutter/material.dart';
import 'package:todo_app/constant/appcolors.dart';
import 'package:todo_app/views/homepage.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool isProtected = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    emailFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    
    bool isKeyboardOpen = keyboardHeight > 0;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: isKeyboardOpen
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(top: isKeyboardOpen ? 20.0 : sh * 0.16),
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topRight,
              colors: [AppColors.appbarColor, AppColors.bgColor],
              radius: 0.5,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.task_alt_rounded,
                    color: AppColors.taskCardBorderColor,
                    size: sh * 0.13,
                  ),
                  SizedBox(width: sw * 0.02),
                  const Text(
                    "DSTP-TODO",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: sh * 0.05),
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryText,
                  fontSize: 37,
                ),
              ),
              const Text(
                "Sign in to continue your journey",
                style: TextStyle(color: Colors.white70),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: sh * 0.06,
                  left: sw * 0.07,
                  right: sw * 0.07,
                ),
                decoration: BoxDecoration(
                  boxShadow: emailFocus.hasFocus
                      ? [
                          const BoxShadow(
                            color: AppColors.appbarColor,
                            blurRadius: 6,
                            spreadRadius: 0.4,
                          ),
                        ]
                      : null,
                ),
                child: TextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  focusNode: emailFocus,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(passFocus);
                  },
                  keyboardType: TextInputType.emailAddress,
                  enableSuggestions: true,
                  style: const TextStyle(color: AppColors.secondaryText),
                  decoration: InputDecoration(
                    fillColor: AppColors.inputFieldBgColor,
                    filled: true,
                    labelText: 'Email Address',
                    hintText: "abc@email.com",
                    hintStyle: const TextStyle(color: AppColors.secondaryText),
                    prefixIcon: const Icon(Icons.email_outlined),
                    prefixIconColor: AppColors.inputHintTextColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: AppColors.taskCardBorderColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: AppColors.taskCardBorderColor,
                        width: 2.0,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: sh * 0.02,
                  left: sw * 0.07,
                  right: sw * 0.07,
                ),
                decoration: BoxDecoration(
                  boxShadow: passFocus.hasFocus
                      ? [
                          BoxShadow(
                            color: AppColors.appbarColor,
                            blurRadius: 6,
                            spreadRadius: 0.4,
                          ),
                        ]
                      : null,
                ),
                child: TextField(
                  obscureText: isProtected,
                  focusNode: passFocus,
                  autofillHints: const [AutofillHints.password],
                  style: const TextStyle(color: AppColors.secondaryText),
                  decoration: InputDecoration(
                    fillColor: AppColors.inputFieldBgColor,
                    filled: true,
                    hintText: "Password",
                    hintStyle: const TextStyle(color: AppColors.secondaryText),
                    prefixIcon: const Icon(Icons.lock_outline),
                    prefixIconColor: AppColors.inputHintTextColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: AppColors.taskCardBorderColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: AppColors.taskCardBorderColor,
                        width: 2.0,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isProtected = !isProtected;
                        });
                      },
                      icon: isProtected
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                    ),
                  ),
                ),
              ),
              SizedBox(height: sh * 0.02),
              Padding(
                padding: EdgeInsets.only(right: sw * 0.03, left: sw * 0.03),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: const Text("Forgot Password"),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: sh * 0.06),
              Container(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.06),
                width: double.infinity,
                height: sh * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appbarColor,
                  ),
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });

                          await Future.delayed(const Duration(seconds: 2));

                          if (!mounted) return;

                          setState(() {
                            isLoading = false;
                          });

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: AppColors.primaryText,
                                strokeWidth: 2,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              "Signing...",
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      : const Text(
                          "LOGIN",
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              SizedBox(height: sh * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: AppColors.primaryText),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: AppColors.fabColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: sh * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
