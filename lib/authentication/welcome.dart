import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BackgroundImageWidget(), // Replace this with your content
      ),
    );
  }
}

class BackgroundImageWidget extends StatelessWidget {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
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
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row(
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 62,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
             SizedBox(height: 100.0),
           Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 126, 4, 163),
                            elevation: 0,
                            padding: EdgeInsets.all(20)
                          ),
                          onPressed: () {
                            if (_fromKey.currentState!.validate()) {
                              _fromKey.currentState!.save();
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20.0, // Adjust the font size as needed
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                                   // Change the text color if desired
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
              children: [
                Text(
                  'already you have account',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 126, 4, 163),
                            elevation: 0,
                            padding: EdgeInsets.all(20)
                          ),
                          onPressed: () {
                            if (_fromKey.currentState!.validate()) {
                              _fromKey.currentState!.save();
                            }
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 20.0, // Adjust the font size as needed
                              fontWeight: FontWeight.bold,
                              color:Colors.white // Change the text color if desired
                            ),
                          )),
                    ),
                  ],
                ),
            // Add additional widgets or rows here if needed
          ],
        ),
      ),
    );
  }
}
