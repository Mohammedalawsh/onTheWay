import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'dart:io';
import 'package:otw1/components/custombuttonauth.dart';
import 'package:otw1/components/customlogoauth.dart';
import 'package:otw1/vehicle_form.dart';
// import 'package:fluttercourse/components/textformfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  final TextEditingController _phoneController=TextEditingController();
  bool term = false;
bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 50),
                const CustomLogoAuth(),
                Container(height: 20),
                const Center(
                  child: Text("SignUp",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0))),
                ),
                const Center(
                  child: Text("Enter yore information to create an account",
                      style: TextStyle(
                          fontSize: 14, color: Color.fromARGB(255, 69, 69, 69))),
                ),
                Container(height: 10),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Your Name",
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please Enter your name";
                  //   }
                  //   return null;
                  // },
                  // onChanged: (value) => name = value
                ),
                Container(height: 13),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    labelText: "Pick a Username",
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Container(height: 13),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.numbers),
                    labelText: "Your number ( +967 ) ",
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Container(height: 13),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    labelText: "Your Email",
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Container(height: 13),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: "Enter a password for your account",
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.only(top: 10, bottom: 20),
                //   alignment: Alignment.topLeft,
                //   child: const Text(
                //     "Accept OTW Terms & Review Privacy Notice",
                //     style: TextStyle(
                //         fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                //   ),
                // ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 50)),
                    Text(
                      "Accept OTW Terms & Review Privacy Notice",
                      style: TextStyle(
                          fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Container(
                      child: Checkbox(
                          value: term,
                          onChanged: (val) {
                            setState(() {
                              term = val!;
                            });
                          }),
                    ),
                  ],
                ),
              ],
            ),
            CustomButtonAuth(
                title: "SignUp",
                onPressed: () async{
                  
                  try {
                    setState(() {
                      isLoading=true;
                    });
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  ).whenComplete(()async{
                    if(FirebaseAuth.instance.currentUser!.uid!=null)
                    {
                      final uid=FirebaseAuth.instance.currentUser!.uid;
await FirebaseFirestore.instance.collection('users').doc(uid).set({
  'userId':uid,
  'email':email,
  'phone':_phoneController.text,
  'username':name,
});
                    }
                    setState(() {
                      isLoading=false;
                    });
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>VehicleForm()));
          
                  }
                  );
                  // Navigator.of(context).pushNamed("vehicalee");
                } on FirebaseAuthException catch (e) {
                  setState(() {
                    isLoading=false;
                  });
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  setState(() {
                    
                  });
                  print(e);
                }
                }),
                
            MaterialButton(
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: const Color.fromARGB(255, 0, 0, 0),
                textColor: Colors.white,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Login With Facebook  "),
                    Image.asset(
                      "images/facebook.png",
                      width: 20,
                    )
                  ],
                )),
                
            MaterialButton(
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: const Color.fromARGB(255, 0, 0, 0),
                textColor: Colors.white,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Login With Google  "),
                    Image.asset(
                      "images/google.png",
                      width: 20,
                    )
                  ],
                )),
            Container(height: 10),
            // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("vehicalee");
              },
              child: const Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "Have An Account ? ",
                  ),
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                          color: Color.fromARGB(255, 58, 58, 58),
                          fontWeight: FontWeight.bold)),
                ])),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
