import 'package:flutter/material.dart';
import '../HomeScreen/HomeScreen.dart';
import '../Services/Services.dart';
import '../Loginpage/LoginPage.dart';

class ProfilePage extends StatefulWidget {
  final Services services;
  final String loginvia;
  const ProfilePage(
      {super.key, required this.services, required this.loginvia});

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

Future<void> _showLinkWithEmailDialog() async {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true, // Set to true to display above the keyboard
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: Colors.white, // Set the background color to white
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Link with Email',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    widget.services
                        .linkEmailAndPassword(
                            emailController.text, passwordController.text)
                        .then((value) 
                        {
                          if(value == 'true')
                          {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Linking successful.'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            };

                            if (value == 'already') {
                              Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Account is already linked with Email'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                        }
                      );
                          
                  },
                  child: Text('Link'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
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
          ElevatedButton(
            onPressed: () {
              _showLinkWithEmailDialog();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 167, 210, 245),
              foregroundColor: Colors.black,
              minimumSize: Size(300, 48),
            ),
            child: Text('Link with Email'),
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
                          content: Text('Linking succesful.'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }

                    if (value == 'already') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Account is already linked with Google'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 167, 210, 245), 
                  foregroundColor:
                      Colors.black, 
                  minimumSize:
                      Size(300, 48),
                ),
                child: Text('Link with Google')),
          ),
          const SizedBox(height: 20),
          Container(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  widget.services.linkAccountWithFacebook().then((value) {
                    if (value == 'true') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Linking succesful.'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }

                    if (value == 'already') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Account is already linked with Facebook'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 167, 210, 245), 
                  foregroundColor:
                      Colors.black, 
                  minimumSize:
                      Size(300, 48), 
                ),
                child: Text('Link with Facebook')),
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
                      255, 248, 108, 108), 
                  foregroundColor:
                      Colors.black, 
                  minimumSize:
                      Size(300, 48),
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
                      builder: (context) => HomeScreen(
                            services: widget.services,
                            loginvia: widget.loginvia,
                          )),
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
                      builder: (context) => ProfilePage(
                          services: widget.services,
                          loginvia: widget.loginvia)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
