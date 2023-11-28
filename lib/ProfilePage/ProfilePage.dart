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
      

        body: Column(
          children: [

Container(
  padding: EdgeInsets.fromLTRB(80, 20, 0, 0),
  child:   Row(children: [
           Text('Welcome',style: TextStyle(fontSize: 20)),
           const SizedBox(width: 10),
            Text('Surya Vamsi',style: TextStyle(fontSize: 20))
            ],),
)
          

        ]),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          notchMargin: 8.0, // Adjust the margin of the notch
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.calendar_month),
  
                onPressed: () {
                  // Handle tapping on the first tab
                },
              ),
              IconButton(
                icon: Icon(Icons.bar_chart),
                onPressed: () {
                  // Handle tapping on the second tab
                },
              ),
              SizedBox(), // This SizedBox is used to create space for the FAB
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
        )  
            );
  }
}
