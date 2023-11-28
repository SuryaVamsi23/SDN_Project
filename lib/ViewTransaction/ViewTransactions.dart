import 'package:flutter/material.dart';

class ViewTransactions extends StatefulWidget {
  final DateTime selecteddate;
  const ViewTransactions({super.key, required this.selecteddate});

  @override
  State<ViewTransactions> createState() => _ViewTransactionsState();
}

class _ViewTransactionsState extends State<ViewTransactions> {
  @override
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
              Text("1000")
            ]),
            Row(children: [
               Image.asset("assets/airplane.png",height: 40,width: 40),
              const SizedBox(width: 20),
              Text('Travel', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 80),
              Text('200', style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold))
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
              Text('200', style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold))
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
              Text('200', style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold))
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
              Text('200', style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold))
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
              Text('200', style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.bold))
            ]),
          ],
        ),
      ),
    );
  }
}
