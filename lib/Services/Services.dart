import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Services {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var FirebaseUser;
  CollectionReference usercollection =
      FirebaseFirestore.instance.collection('users');
  CollectionReference transactioncollection =
      FirebaseFirestore.instance.collection('transactions');

  Future<String> SignUp(String name, String email, String Password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: Password);
      FirebaseUser = FirebaseAuth.instance.currentUser;
      String id = FirebaseUser.uid;

      await usercollection
          .doc(id)
          .set({"name": name, "transaction": {}, "monthly": {},"email": email});
      return 'true';
    } catch (e) {
      return 'false';
    }
  }

  Future<String> SignIn(String email, String Password) async {
    print("Signin with email password");
    print(email);
    print(Password);
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: Password);
      FirebaseUser = FirebaseAuth.instance.currentUser;
      String id = FirebaseUser.uid;
      print(id);
      return 'true';
    } catch (e) {
      return 'false';
    }
  }

  Future<bool> AddTransaction(
      String type, String date, double amount, String month) async {
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
      print("Montly");
      print(month);
      double full = 0;
      if (data["monthly"][month] == null) {
        full = amount;
      } else {
        full = amount + data["monthly"][month];
      }
      transactioncollection.add(newTransaction).then((value) => {
            usercollection.doc(id).update({"transaction.$date": value.id}),
            if (data["monthly"][month] == null)
              {
                print("int if monthly"),
                usercollection.doc(id).update({"monthly.$month": full})
              }
            else
              {
                print("In add montly else"),
                print(data["monthly"][month] + amount),
                usercollection.doc(id).update({"monthly.$month": full})
              }
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
      double full = 0;
      if (data["monthly"][month] == null) {
        full = amount;
      } else {
        full = amount + data["monthly"][month];
      }
      if (data["monthly"][month] == null) {
        print("int if monthly");
        usercollection.doc(id).update({"monthly.$month": full});
      } else {
        print("In add montly else");
        print(data["monthly"][month] + amount);
        usercollection.doc(id).update({"monthly.$month": full});
      }
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

  Future<double> getMonthly() async {
    String id = _auth.currentUser!.uid;
    double ans = 0;
    String month = '${DateTime.now().year}-${DateTime.now().month}';
    var data = await usercollection.doc(id).get();
    if (data['monthly'][month] == null)
      ans = 0;
    else
      ans = data["monthly"][month];
    return ans;
  }

  Future<String> get_name() async {
    String id = _auth.currentUser!.uid;
    var data = await usercollection.doc(id).get();
    return (data["name"]);
  }

  Future<bool> oauth_google() async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? user =
          await GoogleSignIn(forceCodeForRefreshToken: true).signIn();
      if (user == null) return false;
      final GoogleSignInAuthentication googleauth = await user.authentication;
      final AuthCredential creds = await GoogleAuthProvider.credential(
          accessToken: googleauth.accessToken, idToken: googleauth.idToken);
      UserCredential auth = await _auth.signInWithCredential(creds);
      DocumentSnapshot userDoc = await usercollection.doc(auth.user?.uid).get();
      String email = user!.email ?? "";
      String name = user.displayName ?? "";
      if (userDoc.exists) {
        print('User Already Exist : Updating Only Gmail');
        await usercollection.doc(auth.user?.uid).update({
          'google': email,
        });
      } else {
        await usercollection.doc(auth.user?.uid).set(
            {"name": name, 'google': email, "transaction": {}, "monthly": {}});
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> oauth_facebook() async {
    try {
      print("called facebook auth");
      await FacebookAuth.instance.logOut();
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final graphResponse = await http.get(
          Uri.parse('https://graph.facebook.com/v14.0/me?fields=id,name,email'),
          headers: {'Authorization': 'Bearer ${accessToken.token}'},
        );
        final Map<String, dynamic> userData = json.decode(graphResponse.body);
        String facebookName = userData['name'] ?? '';
        String facebookEmail = userData['email'] ?? '';
        final AuthCredential creds =
            FacebookAuthProvider.credential(result.accessToken!.token);
        UserCredential auth = await _auth.signInWithCredential(creds);
        DocumentSnapshot userDoc =
            await usercollection.doc(auth.user?.uid).get();

        if (userDoc.exists) {
          print('User Already Exist: Updating Only Facebook');
          await usercollection.doc(auth.user?.uid).update({
            'facebook': facebookEmail,
          });
        } else {
          await usercollection.doc(auth.user?.uid).set({
            "name": facebookName,
            'facebook': facebookEmail,
            "transaction": {},
            "monthly": {},
          });
        }

        return true;
      } else if (result.status == LoginStatus.cancelled) {
        return false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<dynamic>> get_yearly() async {
    List ans = await [];
    String id = _auth.currentUser!.uid;
    for (int i = 1; i <= 12; i++) {
      String month = '${DateTime.now().year}-${i}';
      var data = await usercollection.doc(id).get();
      if (data['monthly'][month] == null)
        ans.add(0);
      else
        ans.add(data["monthly"][month]);
    }
    return ans;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<String> linkAccountWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn(forceCodeForRefreshToken: true).signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      AuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      User? user = _auth.currentUser;
      try {
        await user?.linkWithCredential(googleCredential);

        await usercollection.doc(user?.uid).update({
          'google': googleSignInAccount.email,
        });

        return 'true';
      } catch (e) {
        return 'already';
      }
    } catch (e) {
      return 'false';
    }
  }

  Future<String> linkAccountWithFacebook() async {
    try {
      await FacebookAuth.instance.logOut();
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.cancelled) {
        return 'false';
      }

      final AccessToken accessToken = result.accessToken!;
      final AuthCredential facebookCredential =
          FacebookAuthProvider.credential(accessToken.token);

      User? user = _auth.currentUser;
      try {
        try {
          await user?.linkWithCredential(facebookCredential);
          final graphResponse = await http.get(
            Uri.parse(
                'https://graph.facebook.com/v14.0/me?fields=id,name,email'),
            headers: {'Authorization': 'Bearer ${accessToken.token}'},
          );
          final Map<String, dynamic> facebookUserData =
              json.decode(graphResponse.body);
          String facebookEmail = facebookUserData['email'] ?? '';

          await usercollection.doc(user?.uid).update({
            'facebook': facebookEmail,
          });

          return 'true';
        } catch (e) {
          return 'already';
        }
      } catch (e) {
        return 'false';
      }
    } catch (e) {
      return 'false';
    }
  }

  Future<String> linkEmailAndPassword(String email, String password) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      try {
        await user!.linkWithCredential(credential);
          await usercollection.doc(user?.uid).update({
            'email': email,
          });
        return 'true';
      } catch (e) {
        return 'already';
      }
    } catch (e) {
      return 'false';
    }
  }

  Future<String> getprovider() async {
    User? user = FirebaseAuth.instance.currentUser;
    String login = '';
    if (user != null) {
      if (user.providerData.isNotEmpty) {
        login = user.providerData.first.providerId;
      }
    }
    return login;
  }
}
