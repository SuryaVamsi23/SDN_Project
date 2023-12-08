import 'package:expensetracker/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import '../Services/Services.dart';
class AddTransaction extends StatefulWidget {
  final Services services;
  const AddTransaction({super.key,required this.services});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  String selectedCat = '';
  TextEditingController amountController = new TextEditingController();
  String selectedDate = '';
  String selectedMonth = '';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      String temp = "";
      setState(() {
        selectedDate = '${picked.day}-${picked.month}-${picked.year}';
        selectedMonth = '${picked.year}-${picked.month}';
      });
    }

    print("Selected date = ");
    print(selectedDate);
  }

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
                                      10.0), 
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
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
                                      10.0), 
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
                                      10.0), 
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
                                      10.0), 
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add amount',
                    ),
                    controller: amountController,
                  ),
                ),
                const SizedBox(height: 20),
                Text('Select Date',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Container(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 167, 210,
                            245), 
                        foregroundColor: Colors
                            .black, 
                        minimumSize:
                            Size(200, 48), 
                      ),
                      child: Text('Select Date')),
                ),
                Text('Selected Date',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text(selectedDate,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 20),
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
                      widget.services.AddTransaction(selectedCat, selectedDate, double.parse(amountController.text),selectedMonth);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen(services: widget.services)),
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
