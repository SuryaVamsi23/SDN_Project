import 'package:flutter/material.dart';
import '../HomeScreen/HomeScreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                Text('Profile', style: TextStyle(fontWeight: FontWeight.bold))),
        body: Column(
          children: [
            Container(
              height: 40,
              width: 200,
              color: Colors.black,
              child: Center(
                child: Text(
                  'Welcome Surya Vamsi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          notchMargin: 8.0, // Adjust the margin of the notch
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.calendar_month),
                onPressed: () {
                  // Handle tapping on the first tab
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.bar_chart),
                onPressed: () {
                  // Handle tapping on the second tab
                },
              ),
              // This SizedBox is used to create space for the FAB
              IconButton(
                icon: Icon(Icons.person),
                color: Colors.black,
                onPressed: () {
                  // Handle tapping on the fourth tab
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
