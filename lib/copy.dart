import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:otw1/Home_sreen.dart';
class vehicalee extends StatefulWidget {
  const vehicalee({super.key});

  @override
  State<vehicalee> createState() => _vehicaleeState();
}

class _vehicaleeState extends State<vehicalee> {

  
  TextEditingController vechalNameController=  TextEditingController();
  TextEditingController ManufactureController=  TextEditingController();
  TextEditingController TypeController=  TextEditingController();


  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
// List<File?> selectedFiles = List.filled(4, null);
//   Future<void> uploadPdfToFirestore(String fileName, File file) async {
//   final refrence = FirebaseStorage.instance.ref().child("D:\New folder/$fileName.pdf");
//   final uploadTask = refrence.putFile(file);
//   await uploadTask.whenComplete(() {});
//   final downloadLink = await refrence.getDownloadURL();

//   await _firebaseFirestore.collection("pdf").add({
//     "name": fileName,
//     "url": downloadLink,
//   });
//   }
 List<File?> selectedFiles = List.filled(4, null);
Future<void> selectPdfFiles() async {
  final pickedFiles = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
    allowMultiple: true,
  );

  if (pickedFiles != null) {
    for (int i = 0; i < pickedFiles.files.length; i++) {
      selectedFiles[i] = File(pickedFiles.files[i].path!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF file ${i + 1} selected.'),
        ),
      );
    }
  }
}

Future<bool> areAllFileSelected() async {
  bool allFilesSelected = true;
  for (int i = 0; i < selectedFiles.length; i++) {
    if (selectedFiles[i] == null) {
      allFilesSelected = false;
      break;
    }
  }
  return allFilesSelected;
}

Future<void> uploadPdfToFirestore(String fileName, File file) async {
  try {
    // Get a reference to the Firestore storage
    final storageRef = FirebaseStorage.instance.ref().child('pdfs/$fileName');

    // Upload the file to Firestore
    await storageRef.putFile(file);

    // Get the download URL for the uploaded file
    final downloadUrl = await storageRef.getDownloadURL();

    // Save the download URL to Firestore
    await FirebaseFirestore.instance.collection('pdf_files').add({
      'fileName': fileName,
      'downloadUrl': downloadUrl,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF file $fileName uploaded successfully!'),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error uploading PDF file $fileName: $e'),
      ),
    );
  }
}
Future<void> uploadPdfsToFirestore() async {
  bool allFilesSelected = await areAllFileSelected();
  if (allFilesSelected) {
    for (int i = 0; i < selectedFiles.length; i++) {
      String fileName = selectedFiles[i]!.path.split('/').last;
      await uploadPdfToFirestore(fileName, selectedFiles[i]!);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDFs uploaded successfully!'),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please select all PDF files.'),
      ),
    );
  }
}
  @override
  Widget build(BuildContext context) {
      CollectionReference users = FirebaseFirestore.instance.collection('Vehicle owner');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'vehcalname': vechalNameController.text, // John Doe
            'Year of Manufacture': ManufactureController.text, // Stokes and Sons
            'Type of vechal': TypeController.text // 42
          })
          .then((value) => print("Vehicle owner Added"))
          .catchError((error) => print("Failed to add Vehicle owner: $error"));
    }
   


    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 60 ,)),
              Icon(Icons.taxi_alert, color:Colors.white, size: 170,),
              Text('On The Way',style: TextStyle(fontSize: 24,color: Colors.white),),
              SizedBox(height: 10,),
               Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 10,top: 20),
                width: 200,
              child: TextFormField(
                 controller: vechalNameController,
                cursorColor: Colors.black,
                // keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontWeight: FontWeight.bold),
                
                decoration: InputDecoration(
                  hintText: "vehicle name",
                  
                  hintMaxLines: 2,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person,color: Colors.black,),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,),
                    borderRadius: BorderRadius.circular(20)
                    )
                ),
              )
              ,),
              Container(
                    padding: EdgeInsets.only(left: 3 ,top: 20),
                width: 200,
              child: TextFormField(
                
                controller: ManufactureController,
                cursorColor: Colors.black,
                // keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontWeight: FontWeight.bold),
                
                decoration: InputDecoration(
                  hintText: "Year of Manufacture",
                  
                  //hintMaxLines: 2,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person,color: Colors.black,),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,),
                    borderRadius: BorderRadius.circular(20)
                    )
                ),
              )
              ,),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 18 ,top: 12 ,right: 10),
                width: 200,
              child: TextFormField(
                controller: TypeController,
                cursorColor: Colors.black,
                // keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontWeight: FontWeight.bold),
                
                decoration: InputDecoration(
                  hintText: "Type of vehicle",
                  
                  //hintMaxLines: 2,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person,color: Colors.black,),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,),
                    borderRadius: BorderRadius.circular(20)
                    )
                ),
              )
              ,),
                ],
              ),
               SizedBox(height: 10,),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  InkWell(onTap: () {},
                  child: Text('Identification card ' ,style: TextStyle(fontSize: 18,color: Colors.white),),
                  ),
                  Container(
                    
                    padding: EdgeInsets.only(left: 105),
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(15)),
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 30, top: 10, bottom: 15, right: 35),
                        onPressed: ()async {
                          await selectPdfFiles();
                                       },
                        child: Text(
                          "Add ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  InkWell(onTap: () {},
                  child: Text('Driving license   ' ,style: TextStyle(fontSize: 18,color: Colors.white),),
                  ),
                  Container(
                    
                    padding: EdgeInsets.only(left: 125),
                    child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:BorderRadius.circular(15)),
                                  color: Colors.white,
                                  padding: EdgeInsets.only(
                                      left: 30, top: 10, bottom: 15, right: 35),
                                  onPressed: ()async {
                                 await selectPdfFiles();
                        },
                        child: Text(
                          "Add ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  InkWell(onTap: () {},
                  child: Text('Vehicle ownership' ,style: TextStyle(fontSize: 18,color: Colors.white),),
                  ),
                  Container(
                    
                    padding: EdgeInsets.only(left: 110),
                    child:  MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(15)),
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 30, top: 10, bottom: 15, right: 35),
                        onPressed: ()async {
                         await selectPdfFiles();
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ),
                ],
              ),
               SizedBox(height: 10,),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  InkWell(onTap: () {},
                  child: Text('Delegation' ,style: TextStyle(fontSize: 18,color: Colors.white),),
                  ),
                  Container(
                    
                    padding: EdgeInsets.only(left: 174),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      padding:EdgeInsets.only(left: 30,top: 10,bottom: 15,right: 35),
                      
                      onPressed: () async {
                         await selectPdfFiles();
                        },
                    child: Text("Add",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
              child:Column( children: [
                Text('You will receive a message via your email after the competent authorities verify your and your vehicle,s data and allow you to work as a driver, in accordance with our privacy and the customer’s trust in us. Thank you for being with us.'
                ,style:TextStyle(fontSize: 15,color: Colors.white))
              ],),
              ),
              SizedBox(height: 17,),
              Row(children: [
                Container(
                    
                    padding: EdgeInsets.only(left: 20),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      padding:EdgeInsets.only(left: 30,top: 15,bottom: 15,right: 35),
                      
                      onPressed: () async{
                        await FirebaseAuth.instance.signOut();
                         Navigator.of(context).pushNamedAndRemoveUntil("login",(route)=>false);
                        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const loginC()));
                      },
                    child: Text("Back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(width: 50,),
                  Container(
                    
                    padding: EdgeInsets.only(left: 35),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      padding:EdgeInsets.only(left: 30,top: 15,bottom: 15,right: 35),
                      
                      onPressed: () async {
                                        //  await selectPdfFiles();
                                        await uploadPdfsToFirestore();
                                        addUser();
                                      //  await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const home_Sreen()));

                        },
                    child: Text("Continue",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                  ),
              ],)
               
             
             
            ],
          ),
        ),
      ),
    );
  }
}