import 'package:expensetracker/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../AddTransaction/AddTransaction.dart';
import '../ViewTransaction/ViewTransactions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  String finalDate = '';
  DateTime _selectedDay = DateTime.now();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Daily Transactions',
                style: TextStyle(fontWeight: FontWeight.bold))),
        body: Column(
          children: [
            Container(
                child: TableCalendar(
              locale: "en_US",
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2010, 24, 11),
              lastDay: DateTime.utc(2050, 24, 11),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  focusedDay = selectedDay;
                  _selectedDay = selectedDay;
                  finalDate = '${_selectedDay.day}-${_selectedDay.month}-${_selectedDay.year}';
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewTransactions(selecteddate: finalDate)),
                );
              },
            ))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTransaction()),
            );
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.black,
          shape: CircleBorder(),
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
                color: Colors.black,
                onPressed: () {
                  // Handle tapping on the first tab
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
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
