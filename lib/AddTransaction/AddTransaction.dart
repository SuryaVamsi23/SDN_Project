import 'package:expensetracker/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  String selectedCat = '';
  TextEditingController amount = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Create budget',
              style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        children: [
          Container(
            color: Color.fromARGB(255, 255, 255, 255),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Choose category',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                            width: 140,
                            height: 135,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedCat = 'Travel';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the radius as needed
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Icon(Icons.travel_explore,
                                    //     color: Colors.black),
                                    Image.asset("assets/airplane.png"),
                                    Text(
                                      'Travel',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ]),
                            )),
                        Container(
                            width: 140,
                            height: 135,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedCat = 'Shopping';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the radius as needed
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/online-shopping.png"),
                                    Text(
                                      'Shopping',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ]),
                            )),
                        Container(
                            width: 140,
                            height: 135,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedCat = 'Housing';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the radius as needed
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/house.png"),
                                    Text(
                                      'Housing',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ]),
                            )),
                        Container(
                            width: 140,
                            height: 135,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedCat = 'Debt Payments';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the radius as needed
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/loan.png"),
                                    Text(
                                      'Debt',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ]),
                            )),
                        Container(
                            width: 140,
                            height: 135,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedCat = 'Personal expense';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the radius as needed
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/account.png"),
                                    Text(
                                      'Personal',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ]),
                            )),
                      ],
                    )),
                const SizedBox(height: 20),
                Text('Selected Category',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text(selectedCat,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 20),
                Text('Add Amount',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: amount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add amount',
                    ),
                    //controller: emailcontroller,
                  ),
                ),
                const SizedBox(height: 300),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                          Colors.black, // Set the background color to black
                      foregroundColor:
                          Colors.white, // Set the text and icon color to white
                      minimumSize:
                          Size(200, 48), // Set the minimum size of the button
                    ),
                    child: Text('Submit')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
