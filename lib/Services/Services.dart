import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var FirebaseUser;
  CollectionReference usercollection =
      FirebaseFirestore.instance.collection('users');
  CollectionReference transactioncollection =
      FirebaseFirestore.instance.collection('transaction');
  Future<bool> SignUp(String name, String email, String Password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: Password);
    FirebaseUser = FirebaseAuth.instance.currentUser;
    String id = FirebaseUser.uid;

    await usercollection.doc(id).set({"name": name});
    return true;
  }

  Future<bool> AddTransaction(String type, DateTime date, double money) async {
    transactioncollection
        .where('date', isEqualTo: date)
        .snapshots()
        .listen((QuerySnapshot value) {
      if (value.size > 0) {
        value.docs.forEach((DocumentSnapshot doc) {
          var updated = {};
          updated[type] = doc[type] + money;
          transactioncollection.doc(doc.id).update({type: doc[type] + money});
        });
      } else {
        var newTransaction = {
          "date": date,
          "debt": 0.0,
          "housing": 0.0,
          "personal": 0.0,
          "shopping": 0.0,
          "travel": 0.0
        };
        newTransaction[type] = money;

        transactioncollection.add(newTransaction);
      }
    });

    return true;
  }
}
