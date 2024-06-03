// import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

class vehical extends StatefulWidget {
  vehical({super.key});

  
  @override
  State<vehical> createState() => _vehicalState();
}

class _vehicalState extends State<vehical> {
  // final nameController= TextEditingController();
  // final mobileController= TextEditingController();
  // final emailController= TextEditingController();
  
 
  TextEditingController nameController=  TextEditingController();
  TextEditingController mobileController=  TextEditingController();
  TextEditingController emailController=  TextEditingController();


  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'nameController': nameController.text, // John Doe
            'mobileController': mobileController.text, // Stokes and Sons
            'emailController': emailController.text // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 52,),
            Container(
                    padding: EdgeInsets.only(left: 20, right: 10, top: 20),
                    width: 200,
                    child: TextFormField(
                      controller: nameController,
                      cursorColor: Colors.black,
                      // keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: "vehicle name",
                          hintMaxLines: 2,
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(20))),
                              // onChanged: (String name){
                                
                              // },
                    ),
                  ),
                  SizedBox(height: 20,),
            Container(
                    padding: EdgeInsets.only(left: 20, right: 10, top: 20),
                    width: 200,
                    child: TextFormField(
                      controller: mobileController,
                      cursorColor: Colors.black,
                      // keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: "vehicle name",
                          hintMaxLines: 2,
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(20))),
                              // onChanged: (String name){
                                
                              // },
                    ),
                  ),
                  SizedBox(height: 20,),
            Container(
                    padding: EdgeInsets.only(left: 20, right: 10, top: 20),
                    width: 200,
                    child: TextFormField(
                      controller: emailController,
                      cursorColor: Colors.black,
                      // keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: "vehicle name",
                          hintMaxLines: 2,
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(20))),
                              // onChanged: (String name){
                                
                              // },
                    ),
                  ),
                  SizedBox(height: 25,),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          left: 30, top: 10, bottom: 15, right: 35),
                      onPressed: () {
                        // addUser();
                      //   Map<String,dynamic> data={"field1":sampledata1,
                      //   "field2":sampledata2,
                      //   "field3":sampledata3
                      //   };
                      //   CollectionReference data= FirebaseFirestore.instance.collection('client');
                        

                      },
                      child: Text(
                        "Add ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}