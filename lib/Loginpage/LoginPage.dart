import 'package:expensetracker/Signup/Signup.dart';
import 'package:flutter/material.dart';
import '../HomeScreen/HomeScreen.dart';
import '../Services/Services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Services services = new Services();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('TRACKEXP',
                style: TextStyle(fontWeight: FontWeight.bold))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                    services.SignIn(
                            emailcontroller.text, passwordcontroller.text)
                        .then((value) {
                          print('In signin');
                        print(value);
                      if (value == 'true') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(services: services,loginvia: 'Logged in via Email and Password',)),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Login failed. Please check your credentials.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 167, 210,
                        245), // Set the background color to black
                    foregroundColor:
                        Colors.black, // Set the text and icon color to white
                    minimumSize:
                        Size(200, 48), // Set the minimum size of the button
                  ),
                  child: Text('Login')),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: Row(
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Signup(services: this.services)),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: Column(children: [
                Text('or'),
                const SizedBox(height: 10),
                Text('Connect using'),
                const SizedBox(height: 10),
              ]),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(110, 0, 0, 0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          bool flag = await services.oauth_google();
                          if (flag) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeScreen(services: services,loginvia: 'Logged in via Google')));
                          }
                        },
                        icon: Image.asset("assets/google.png",
                            height: 60, width: 60)),
                    IconButton(
                        onPressed: () async {
                          bool flag = await services.oauth_facebook();
                          if (flag) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeScreen(services: services,loginvia: 'Logged in via Facebook',)));
                          }
                        },
                        icon: Image.asset("assets/facebook.png",
                            height: 40, width: 40))
                  ],
                ))
          ],
        ));
  }
}
