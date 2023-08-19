import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbmi/authentication/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var email;

  var password;

  var name;

  var phonenumber;

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/register.jpg',
                          width: 250,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Register Now!',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Form(
                      key: _fromKey,
                      child: Column(
                        children: [
                          SizedBox(height: 25.0),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter Your Name',
                                  ),
                                  controller: nameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    if (containsNumbers(value)) {
                                      return 'Name should not contain numbers';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter your Phone Number',
                                  ),
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter your Email',
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
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter your Password',
                                  ),
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
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.purple.withOpacity(0.9),
                                        elevation: 0,
                                        padding: EdgeInsets.all(20)),
                                    onPressed: () {
                                      if (_fromKey.currentState!.validate()) {
                                        FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text)
                                            .whenComplete(() =>
                                            Get.to(() => LoginScreen()));
                                      }

                                    },
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
                          const Column(
                            children: [
                              Text("OR"),
                              Text("Already Have an Account?")
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.purple.withOpacity(0.5),
                                        elevation: 0,
                                        padding: EdgeInsets.all(20)),
                                    onPressed: () =>
                                        Get.to(() => LoginScreen()),
                                    child: const Text(
                                      "Login",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool containsNumbers(String input) {
    return RegExp(r'[0-9]').hasMatch(input);
  }

}
