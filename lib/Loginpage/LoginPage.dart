import 'package:flutter/material.dart';
import '../HomeScreen/HomeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
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
            Text('Login/Sign up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email ID',
                ),
                //controller: emailcontroller,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
                obscureText: true,
                //controller: passwordcontroller,
              ),
            ),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // Set the background color to black
                  foregroundColor:
                      Colors.black, // Set the text and icon color to white
                  minimumSize:
                      Size(200, 48), // Set the minimum size of the button
                ),
                child: Row(
                  children: [Text('Login')],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // Set the background color to black
                  foregroundColor:
                      Colors.black, // Set the text and icon color to white
                  minimumSize:
                      Size(200, 48), // Set the minimum size of the button
                ),
                child: Row(
                  children: [Icon(Icons.facebook), Text('Sign In with Google')],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // Set the background color to black
                  foregroundColor:
                      Colors.black, // Set the text and icon color to white
                  minimumSize:
                      Size(120, 40), // Set the minimum size of the button
                ),
                child: Row(
                  children: [
                    Icon(Icons.facebook_rounded),
                    Text('Sign In with Facebook')
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
