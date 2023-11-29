import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var FirebaseUser;
  CollectionReference usercollection =
      FirebaseFirestore.instance.collection('users');
  CollectionReference transactioncollection =
      FirebaseFirestore.instance.collection('transactions');

  Future<String> SignUp(String name, String email, String Password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: Password);
    FirebaseUser = FirebaseAuth.instance.currentUser;
    String id = FirebaseUser.uid;

    await usercollection.doc(id).set({"name": name, "transaction": {}});
    return id;
  }

  Future<String> SignIn(String email, String Password) async {
    print("Signin with email password");
    print(email);
    print(Password);
    UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email, password: Password);
    FirebaseUser = FirebaseAuth.instance.currentUser;
    String id = FirebaseUser.uid;
    print(id);
    return id;
  }

  Future<bool> AddTransaction(String type, String date, double amount) async {
    String id = _auth.currentUser!.uid;
    var data = await usercollection.doc(id).get();
    print("In add transaction");
    print(data["transaction"].containsKey(date));
    if (!data["transaction"].containsKey(date)) {
      var newTransaction = {
        "date": date,
        "Debt Payments": 0.0,
        "Housing": 0.0,
        "Personal expense": 0.0,
        "Shopping": 0.0,
        "Travel": 0.0,
        "Total": 0.0
      };
      newTransaction[type] = amount;
      newTransaction["Total"] = amount;
      transactioncollection.add(newTransaction).then((value) => {
            usercollection.doc(id).update({"transaction.$date": value.id})
          });
    } else {
      print("In else");
      var getdocid = data["transaction"][date];
      print(getdocid);
      var transactiondata = await transactioncollection.doc(getdocid).get();
      print(transactiondata[type]);
      transactioncollection
          .doc(getdocid)
          .update({type: transactiondata[type] + amount});
      transactioncollection
          .doc(getdocid)
          .update({"Total": transactiondata["Total"] + amount});
    }
    return true;
  }

  Future<DocumentSnapshot> getTransaction(String date) async {
        String id = _auth.currentUser!.uid;
      var data = await usercollection.doc(id).get();
      print("Date in getTransaction");
      print(date);
      var map;
       if (data["transaction"].containsKey(date)) {
          var id_doc = data["transaction"][date];
          var map = await transactioncollection.doc(id_doc).get();
          print(map["Total"]);
          return map;
       }
    return map;
  }
}
