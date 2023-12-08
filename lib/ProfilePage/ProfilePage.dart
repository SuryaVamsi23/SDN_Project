import 'package:flutter/material.dart';
import '../HomeScreen/HomeScreen.dart';
import '../Services/Services.dart';

class ProfilePage extends StatefulWidget {
  final Services services;
  const ProfilePage({super.key,required this.services});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String monthlyexpense = '';
  String name = '';
  List ans = [];

  void initState() {
    super.initState();
    fetchdetails();
  }

  Future<void> fetchdetails() async {
    String n = await widget.services.get_name();
    double me = await widget.services.getMonthly();
    print(n);
    setState(() {
      name = n;
      monthlyexpense = me.toString();
    });
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
                  MaterialPageRoute(builder: (context) => HomeScreen(services: widget.services)),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(services: widget.services)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
