import 'package:flutter/material.dart';
import 'package:flutter_signup_login/LoginSinup/HomeScreen.dart';
import 'package:flutter_signup_login/LoginSinup/LoginScreen.dart';
import 'package:flutter_signup_login/Services/authentication.dart';
import 'package:flutter_signup_login/Widgets/SnackBar.dart';

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
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();
  bool isEmailErro = true;
  final RegExp regexp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]');
  bool isLoading = false;

  @override
  void initState() {
    emailController.addListener(
      () {
        if (regexp.hasMatch(emailController.text)) {
          isEmailErro = true;
          print("okela" + isEmailErro.toString());
        } else {
          isEmailErro = false;
          print("okela" + isEmailErro.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Định dạng email bị sai "),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
    );
    super.initState();
  }

  void despose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void SignUpUser() async {
    String res = await AuthServices().SignUpUser(
      email: emailController.text,
      name: nameController.text,
      password: passwordController.text,
    );
    //if signup is success ,usser has been create and navigate to the next screen
    // otherwise show the orror massage
    if (res == 'successfully') {
      setState(() {
        //navigate to the next screen
        isLoading = true;
      });
      // nameController.clear();
      // emailController.clear();
      // passwordController.clear();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Homescreen(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đăng ký tài khoản thành công!'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          emailFocusNode.unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                    focusNode: emailFocusNode,
                    textEditingController: nameController,
                    hintText: "enter your name",
                    icon: Icons.person,
                  ),
                  Textfield(
                    focusNode: passwordFocusNode,
                    textEditingController: emailController,
                    hintText: "enter your email",
                    icon: Icons.email,
                  ),
                  Textfield(
                    focusNode: nameFocusNode,
                    textEditingController: passwordController,
                    hintText: "enter your password",
                    icon: Icons.lock,
                    isPass: true,
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
        ),
      ),
    );
  }
}
