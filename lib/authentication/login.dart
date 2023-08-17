import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbmi/authentication/bmi_screen.dart';
import 'package:newbmi/authentication/register.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImageWidget(), // Replace this with your content
    );
  }
}

class BackgroundImageWidget extends StatelessWidget {
  var email;
  var password;

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/login.jpg',
                            width: 250,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter your email',
                            ),

                            controller: emailController,
                            onSaved: (value) {
                              email = value;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter your password',
                            ),
                            controller: passwordController,

                            onSaved: (value) {
                              password = value;
                            },
                          ),
                          SizedBox(height: 15.0),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        Color.fromARGB(255, 159, 34, 231),
                                        elevation: 0,
                                        padding: EdgeInsets.all(20)),
                                    onPressed: () {
                                      FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        // Adjust the font size as needed
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 249, 249, 250),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Column(
                        children: [Text("OR"), Text("Don't Have an Account?")],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple.withOpacity(0.9),
                                    elevation: 0,
                                    padding: EdgeInsets.all(20)),
                                onPressed: () => Get.to(() => RegisterScreen()),
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 20.0, // Adjust the font size as needed
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 249, 249,
                                        250), // Change the text color if desired
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
