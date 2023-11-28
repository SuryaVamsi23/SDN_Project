import 'package:firebase_auth/firebase_auth.dart';
class Service{
  FirebaseAuth _auth = FirebaseAuth.instance;
  var firebaseuser;
 Future<String> signin(String email, String password) async {
    try {
      UserCredential uc = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      firebaseuser = FirebaseAuth.instance.currentUser;
      return "True";
    } catch (e) {
      return (e.toString());
    }
  }

  //register
  Future register(
      String name,
      String email,
      String pass) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      firebaseuser = FirebaseAuth.instance.currentUser;
      String a = FirebaseAuth.instance.currentUser!.uid;
      // await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(firebaseuser.uid)
      //     .set({
      //   'Name': name,
      //   'Email': email,
      //   'transactions': []
      // });
      // return (true);
    } catch (e) {
      return (e.toString());
    }
  }

}

