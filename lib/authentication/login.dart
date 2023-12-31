import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbmi/authentication/forget_password.dart';
import 'package:newbmi/authentication/register.dart';
import 'package:email_validator/email_validator.dart';
import 'package:newbmi/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email;

  var password;

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _obscureText = true;

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
                          const SizedBox(height: 10.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter your email',
                              prefixIcon: Icon(Icons.email),

                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!EmailValidator.validate(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Enter your password',
                              prefixIcon: const Icon(Icons.fingerprint),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(
                                  _obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            obscureText: _obscureText,
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: ()=>Get.to(()=>const ForgetPassword()), child: const Text("Forget Password?"))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color.fromARGB(255, 159, 34, 231),
                                        elevation: 0,
                                        padding: const EdgeInsets.all(20)),
                                    onPressed: () async {
                                      if (_fromKey.currentState!.validate()) {
                                        try {
                                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                          Get.to(() => const HomePage());
                                        } catch (error) {
                                          String errorMessage = "An error occurred during login.";
                                          if (error is FirebaseAuthException) {
                                            if (error.code == "user-not-found") {
                                              errorMessage = "User not found. Please check your credentials.";
                                            } else if (error.code == "wrong-password") {
                                              errorMessage = "Invalid password. Please check your credentials.";
                                            }
                                          }
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(errorMessage),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        // Adjust the font size as needed
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 249, 249, 250),
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
                                    backgroundColor:
                                        Colors.purple.withOpacity(0.9),
                                    elevation: 0,
                                    padding: const EdgeInsets.all(20)),
                                onPressed: () => Get.to(() => const RegisterScreen()),
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    // Adjust the font size as needed
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
