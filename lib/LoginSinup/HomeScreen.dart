import 'package:flutter/material.dart';
import 'package:flutter_signup_login/LoginSinup/LoginScreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Color(0xFFedf0f8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      title: Center(
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      content: Text(
                        "Are you sure want to logout ?",
                        style: TextStyle(fontSize: 18),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Loginscreen(),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.red, // Red button for emphasis
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10), // Padding for button size
                          ),
                          child: Text(
                            "Yes",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "No",
                            style: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 101, 138, 131),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        child: const SizedBox(
          child: Text('Welcome to the Home Screen!'),
        ),
      ),
    );
  }
}
