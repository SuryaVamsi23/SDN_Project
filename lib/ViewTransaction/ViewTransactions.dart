import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Services/Services.dart';

class ViewTransactions extends StatefulWidget {
  final String selecteddate;
  const ViewTransactions({super.key, required this.selecteddate});

  @override
  State<ViewTransactions> createState() => _ViewTransactionsState();
}

class _ViewTransactionsState extends State<ViewTransactions> {
  @override
  Services services = new Services();
  String total = '0';
  String debt = '0';
  String housing = '0';
  String personal = '0';
  String shopping = '0';
  String travel = '0';
  
    void initState() {
    super.initState();
    // Fetch transactions when the widget is initialized
    fetchTransactions();
  }
    Future<void> fetchTransactions() async {
    // Use your Services class to get the transactions based on the selected date
    DocumentSnapshot ans = await services.getTransaction(widget.selecteddate);
    print("Intransaction");
    print(ans["Total"]);
    setState(() {
      total = ans["Total"].toString();
      debt = ans["Debt Payments"].toString();
      housing = ans["Housing"].toString();
      personal = ans["Personal expense"].toString();
      travel = ans["Travel"].toString();
      shopping = ans["Shopping"].toString();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Transactions',
              style: TextStyle(fontWeight: FontWeight.bold))),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Row( children: [
              Text("22 November",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              Text("Total expense"),
              Text(total)
            ]),
            Row(children: [
               Image.asset("assets/airplane.png",height: 40,width: 40),
              const SizedBox(width: 20),
              Text('Travel', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 80),
              Text(travel, style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold))
            ]),
            Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            Row(children: [
               Image.asset("assets/online-shopping.png",height: 40,width: 40),
              const SizedBox(width: 20),
              Text('Shopping', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 34),
              Text(shopping, style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold))
            ]),
            Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            Row(children: [
               Image.asset("assets/house.png",height: 40,width: 40),
              const SizedBox(width: 20),
              Text('Housing',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(width: 50),
              Text(housing, style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold))
            ]),
            Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            Row(children: [
               Image.asset("assets/loan.png",height: 40,width: 40),
              const SizedBox(width: 20),
              Text('Debt', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 100),
              Text(debt, style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold))
            ]),
            Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            Row(children: [
               Image.asset("assets/account.png",height: 40,width: 40),
              const SizedBox(width: 20),
              Text('Personal', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 50),
              Text(personal, style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold))
            ]),
          ],
        ),
      ),
    );
  }
}
