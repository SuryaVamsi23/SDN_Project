import 'package:expensetracker/Loginpage/LoginPage.dart';
import 'package:flutter/material.dart';
import '../HomeScreen/HomeScreen.dart';
import '../Services/Services.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Services services = new Services();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('TRACKEXP',
                style: TextStyle(fontWeight: FontWeight.bold))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sign up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
                controller: namecontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email ID',
                ),
                controller: emailcontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
                obscureText: true,
                controller: passwordcontroller,
              ),
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    print(namecontroller.text);
                    services.SignUp(namecontroller.text, emailcontroller.text,
                        passwordcontroller.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 167, 210,
                        245), // Set the background color to black
                    foregroundColor:
                        Colors.black, // Set the text and icon color to white
                    minimumSize:
                        Size(200, 48), // Set the minimum size of the button
                  ),
                  child: Text('Sign Up')),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: Row(
                children: [
                  Text("Have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ],
        ));
    ;
  }
}
