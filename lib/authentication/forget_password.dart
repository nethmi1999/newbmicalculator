import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatefulWidget {

  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();


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
                            'assets/images/forget_password.jpg',
                            width: 250,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Forget Your Password?',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
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
                                          await FirebaseAuth.instance
                                              .sendPasswordResetEmail(
                                            email: emailController.text,
                                          ).whenComplete(
                                                () => Get.snackbar(
                                                "Success", "Password Reset Email Send SuccessFully",
                                                snackPosition: SnackPosition.TOP,
                                                backgroundColor: Colors.green[200],
                                                colorText: Colors.blue),
                                          )
                                              .catchError((err, stackTrace) {
                                            Get.snackbar("Error", "Something Went Wrong",
                                                snackPosition: SnackPosition.TOP,
                                                backgroundColor: Colors.green[200],
                                                colorText: Colors.red);
                                            print(err.toString());
                                          });
                                        } catch (error) {
                                          print(error);
                                        }
                                      }
                                    },
                                    child: const Text(
                                      "Send Reset Password Email",
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
