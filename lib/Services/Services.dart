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

    await usercollection.doc(id).set({"name": name,"transaction":{}});
    return id;
  }

  Future<bool> AddTransaction(String type, String date, double amount,String id) async {
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
        "Travel": 0.0
      };
      newTransaction[type] = amount;
      transactioncollection.add(newTransaction).then((value) => 
        usercollection.doc(id).update({"transaction": {date:value.id}})
      );
        
    }
    else
    {
      var getdocid = data["transaction"][date];
      var transactiondata = await transactioncollection.doc(getdocid).update({type: amount});

    }
    return true;
  }
}
