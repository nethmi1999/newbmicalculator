import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  var email;
  var password;

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome.jpg'),
          fit: BoxFit.cover, // Adjust this based on your needs
        ),
      ),
      child: Padding(
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
                    height: 200,
                    width: 200,
                    alignment: Alignment.center,
                    ),
            ],
           ),
             SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
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
                decoration: InputDecoration(
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
                          backgroundColor: Color.fromARGB(255, 159, 34, 231),
                          elevation: 0,
                          padding: EdgeInsets.all(20)
                        ),
                        onPressed: () {
                          if (_fromKey.currentState!.validate()) {
                            _fromKey.currentState!.save();
                          }
                        },
                        child: Text(
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
      ),
    );
  }
}
