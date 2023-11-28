import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                Text('Profile', style: TextStyle(fontWeight: FontWeight.bold))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.black,
          shape: CircleBorder(),
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            notchMargin: 8.0, // Adjust the margin of the notch
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.calendar_month),
                  onPressed: () {
                    // Handle tapping on the first tab
                    _onTabTapped(0);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.bar_chart),
                  onPressed: () {
                    // Handle tapping on the second tab
                    _onTabTapped(1);
                  },
                ),
                SizedBox(), // This SizedBox is used to create space for the FAB
                IconButton(
                  icon: Icon(Icons.wallet),
                  onPressed: () {
                    // Handle tapping on the third tab
                    _onTabTapped(2);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  color: Colors.black,
                  onPressed: () {
                    // Handle tapping on the fourth tab
                    _onTabTapped(3);
                  },
                ),
              ],
            )));
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
