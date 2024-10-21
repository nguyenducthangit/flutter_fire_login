import 'package:flutter/material.dart';
import 'package:flutter_signup_login/LoginSinup/HomeScreen.dart';
import 'package:flutter_signup_login/LoginSinup/LoginScreen.dart';
import 'package:flutter_signup_login/Services/authentication.dart';

import '../Widgets/ButtonLogin.dart';
import '../Widgets/TextField.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  void SignUpUser() async {
    String res = await AuthServices().SignUpUser(
      email: emailController.text,
      name: nameController.text,
      password: passwordController.text,
    );
    //if signup is success ,usser has been create and navigate to the next screen
    // otherwise show the orror massage
    if (res == 'success') {
      setState(() {
        //navigate to the next screen
        isLoading = true;
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Homescreen(),
        ),
      );
    } else {
      // SnackBar(context, res);
      setState(() {
        isLoading = false;
      });
      // show the error massage
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: height / 2.4,
                child: Image.asset("assets/images/signup.jpeg"),
              ),
              Textfield(
                textEditingController: nameController,
                hintText: "enter your name",
                icon: Icons.person,
              ),
              Textfield(
                textEditingController: emailController,
                hintText: "enter your email",
                icon: Icons.email,
              ),
              Textfield(
                textEditingController: passwordController,
                hintText: "enter your password",
                icon: Icons.password,
              ),
              // Button Login
              Buttonlogin(onTad: SignUpUser, text: "Sign Up"),
              SizedBox(
                height: height / 80,
              ),
              // Text(res, style: TextStyle(color: Colors.red)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  const Text(
                    "Already have a account ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Loginscreen(),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
