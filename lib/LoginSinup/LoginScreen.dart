import 'package:flutter/material.dart';
import 'package:flutter_signup_login/LoginSinup/HomeScreen.dart';
import 'package:flutter_signup_login/LoginSinup/Signup.dart';
import 'package:flutter_signup_login/Widgets/ButtonLogin.dart';
import 'package:flutter_signup_login/Widgets/TextField.dart';

import '../Services/authentication.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  //for controler
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void despose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool isLoading = false;
  void loginUser() async {
    String res = await AuthServices().loginUser(
      email: emailController.text,
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đăng nhap thành công!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green[300],
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              'Tai khoan bi sai ',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
      // show the error massage
      SnackBar(content: Text(res));
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: height / 2.7,
                child: Image.asset("assets/images/login.jpg"),
              ),
              Textfield(
                textEditingController: emailController,
                hintText: "enter your email",
                icon: Icons.email,
              ),
              Textfield(
                textEditingController: passwordController,
                hintText: "enter your password",
                icon: Icons.lock,
                isPass: true,
              ),
              // Forgot Password
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Buttonlogin(onTad: loginUser, text: "Login"),
              SizedBox(
                height: height / 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ),
                    ),
                    child: const Text(
                      "Signup",
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
