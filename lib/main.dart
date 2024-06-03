import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otw1/Home_sreen.dart';
// import 'package:otw1/Home_sreen.dart';
// import 'package:otw1/auth/login.dart';
// import 'package:otw1/auth/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:otw1/auth/signup.dart';
// import 'package:otw1/copy.dart';
// import 'package:otw1/copy.dart';
// import 'package:otw1/admain_sreen.dart';
// import 'package:otw1/auth/login.dart';
// import 'package:otw1/auth/signup.dart';
// import 'package:otw1/filedload.dart';
// import 'package:otw1/test1.dart';
// import 'package:otw1/test2.dart';
// import 'package:otw1/test3.dart';
// import 'package:otw1/vehcal.dart';
// import 'package:otw1/vehcall.dart';
// import 'package:otw1/test2.dart';
import 'package:otw1/vehcall.dart';
import 'package:otw1/favorite.dart';
// import 'package:otw1/filedload.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    FirebaseAuth.instance;
    FirebaseAuth.instance.authStateChanges()
    .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignUp(),
      // home:FirebaseAuth.instance.currentUser== null? Login() : vehicalee() ,
      // routes: {
      //   "signup" : (context) => SignUp() , 
      //   "login" : (context) => Login(),
      //   "vehicalee" : (context) => vehicalee()

      // },
    );
  }
}
