import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbmi/authentication/login.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImageWidget(), // Replace this with your content
    );
  }
}

class BackgroundImageWidget extends StatefulWidget {
  @override
  State<BackgroundImageWidget> createState() => _BackgroundImageWidgetState();
}

class _BackgroundImageWidgetState extends State<BackgroundImageWidget> {
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
                            onSaved: (value) {
                              name = value;
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
                            controller: phoneController,
                            onSaved: (value) {
                              phonenumber = value;
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
                            onSaved: (value) {
                              email = value;
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
                            controller: passwordController,
                            onSaved: (value) {
                              password = value;
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
                                  backgroundColor: Colors.purple.withOpacity(0.9),
                                  elevation: 0,
                                  padding: EdgeInsets.all(20)),
                              onPressed: (){

                                FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                                    .whenComplete(() => Get.to(()=>LoginScreen()));

                              },
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
                                  backgroundColor: Colors.purple.withOpacity(0.5),
                                  elevation: 0,
                                  padding: EdgeInsets.all(20)),
                              onPressed: ()=>Get.to(()=>LoginScreen()),
                              child: const Text(
                                "Login",
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
            ],
          ),
        ),
      ),
    );
  }
}
