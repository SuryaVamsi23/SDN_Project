import 'package:flutter/material.dart';
import '../HomeScreen/HomeScreen.dart';
import '../Services/Services.dart';
import '../Loginpage/LoginPage.dart';

class ProfilePage extends StatefulWidget {
  final Services services;
  final String loginvia;
  const ProfilePage({super.key, required this.services,required this.loginvia});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String monthlyexpense = '';
  String name = '';
  List ans = [];
  String get_provider = '';
  void initState() {
    super.initState();
    fetchdetails();
  }

  Future<void> fetchdetails() async {
    String n = await widget.services.get_name();
    double me = await widget.services.getMonthly();
    String t = await widget.services.getprovider();
    print(n);
    setState(() {
      name = n;
      monthlyexpense = me.toString();
      get_provider = t;
    });

    if (get_provider == "password") {
      setState(() {
        get_provider = 'Logged in via Email and Password';
      });
    }

    if (get_provider == "facebook.com") {
      setState(() {
        get_provider = 'Logged in via Facebook';
      });
    }

    if (get_provider == "google.com") {
      setState(() {
        get_provider = 'Logged in via Google';
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              children: [
                const SizedBox(width: 30),
                const SizedBox(width: 30),
                Text(
                  'Welcome ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(16),
            child: Text(
              'Your expense this month: $monthlyexpense',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            widget.loginvia,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  widget.services.linkAccountWithGoogle().then((value) {
                    if (value == 'true') {
                       ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Linking succesful.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                    }

                    if(value == 'already') {
                       ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Account is already linked with google'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  const Color.fromARGB(255, 167, 210,
                        245), // Set the background color to black
                  foregroundColor:
                      Colors.black, // Set the text and icon color to white
                  minimumSize:
                      Size(300, 48), // Set the minimum size of the button
                ),
                child: Text('Link with google')),
          ),
          const SizedBox(height: 20),
          Container(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  widget.services
                      .logout()
                      .then((value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          )));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                      255, 248, 108, 108), // Set the background color to black
                  foregroundColor:
                      Colors.black, // Set the text and icon color to white
                  minimumSize:
                      Size(300, 48), // Set the minimum size of the button
                ),
                child: Text('Logout')),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.calendar_month),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen(services: widget.services,loginvia: widget.loginvia,)),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfilePage(services: widget.services,loginvia: widget.loginvia)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
