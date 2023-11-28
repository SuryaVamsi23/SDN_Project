import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Services
{
    FirebaseAuth _auth = FirebaseAuth.instance;
    var FirebaseUser;
    Future<bool> SignUp(String name, String email, String Password) async{
          await _auth.createUserWithEmailAndPassword(email: email, password: Password);
          FirebaseUser = FirebaseAuth.instance.currentUser;
          String id = FirebaseUser.uid;
          CollectionReference colref = FirebaseFirestore.instance.collection('user');
          colref.doc(id).set({
            name: name,
            Transaction: []
          });
          return true;
    } 
}