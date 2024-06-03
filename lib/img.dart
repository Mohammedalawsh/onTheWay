import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class img extends StatefulWidget {
   img({super.key});

  @override
  State<img> createState() => _imgState();
}

class _imgState extends State<img> {
  // File? file;
  // getfile() async{
  //   final ImagePicker picker = ImagePicker();
  //   // Pick an image.
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   // Capture a photo.
  //   final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  //   if(image !=null){
  //     file =File(photo!.path);

  //     var relStorage =FirebaseStorage.instance.ref("1.jpg");
  //     await relStorage.putFile(file!);
  //   }
  //   setState(() {
      
  //   });
  // }
  // final FirebaseFirestore _firebaseFirestor = FirebaseFirestore.instance;
  
  // Future<String> uploadPdf(String fileName, File file) async {
  //   final refrence = FirebaseStorage.instance.ref().child("D:\New folder/$fileName.pdf");
  //   final uploadTask = refrence.putFile(file);
  //   await uploadTask.whenComplete(() {});
  //   final downloasLink = await refrence.getDownloadURL();
  //   return downloasLink;
    
  // }

  // Future<void> pickFile() async {
  //   final pickedFile = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf'],
  //   );
  //   if (pickedFile != null) {
  //     String fileName = pickedFile.files[0].name;
  //     File file = File(pickedFile.files[0].path!);
  //     final downloadLink = await uploadPdf(fileName, file);
  //     await _firebaseFirestor.collection("pdf").add({
  //       "name": fileName,
  //       "url": downloadLink,
  //     });
  //     print('objecvvvvvvvvt');
  //   }
  // }

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
List<File?> selectedFiles = List.filled(3, null);
  Future<void> uploadPdfToFirestore(String fileName, File file) async {
  final refrence = FirebaseStorage.instance.ref().child("D:\New folder/$fileName.pdf");
  final uploadTask = refrence.putFile(file);
  await uploadTask.whenComplete(() {});
  final downloadLink = await refrence.getDownloadURL();

  await _firebaseFirestore.collection("pdf").add({
    "name": fileName,
    "url": downloadLink,
  });
}
    
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
             MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(15)),
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          left: 30, top: 10, bottom: 15, right: 35),
                      onPressed: ()async {
                      final pickedFile = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );
                      if (pickedFile != null) {
                        selectedFiles[0] = File(pickedFile.files.single.path!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('PDF file 1 selected.'),
                          ),
                        );
                      }
            },
                      child: Text(
                        "Add ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 25,),
                      MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:BorderRadius.circular(15)),
                                color: Colors.white,
                                padding: EdgeInsets.only(
                                    left: 30, top: 10, bottom: 15, right: 35),
                                onPressed: ()async {
                                final pickedFile = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['pdf'],
                                );
                                if (pickedFile != null) {
                                  selectedFiles[1] = File(pickedFile.files.single.path!);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('PDF file 2 selected.'),
                                    ),
                                  );
                                }
                      },
                      child: Text(
                        "Add ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 25,),
             MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(15)),
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          left: 30, top: 10, bottom: 15, right: 35),
                      onPressed: ()async {
                        final pickedFile = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                        );
                        if (pickedFile != null) {
                          selectedFiles[2] = File(pickedFile.files.single.path!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('PDF file 3 selected.'),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Add 3",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (selectedFiles[0] == null || selectedFiles[1] == null || selectedFiles[2] == null)
                    Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    
                    SizedBox(height: 25,),
                          MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:BorderRadius.circular(15)),
                                    color: Colors.white,
                                    padding: EdgeInsets.only(
                                        left: 30, top: 10, bottom: 15, right: 35),
                                    onPressed: ()async {
                                      bool allFilesSelected = true;
                                      for (int i = 0; i < selectedFiles.length; i++) {
                                        if (selectedFiles[i] == null) {
                                          allFilesSelected = false;
                                          break;
                                        }
                                      }
                                      if (allFilesSelected) {
                                        for (int i = 0; i < selectedFiles.length; i++) {
                                          String fileName = selectedFiles[i]!.path.split('/').last;
                                          await uploadPdfToFirestore('File ${i+1}', selectedFiles[i]!);
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
                      },
            
                      child: Text(
                        "Add 4 ",
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
