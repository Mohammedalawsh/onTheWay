import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AdmainSreen extends StatefulWidget {
  const AdmainSreen({super.key});

  @override
  State<AdmainSreen> createState() => _AdmainSreenState();
}

class _AdmainSreenState extends State<AdmainSreen> {
  List<QueryDocumentSnapshot> data = [];

  void getdata() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('on the way')),
    body: Column(
      children: [
        // عناوين ثابتة في أعلى الجدول
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   'Name',
              //   style: TextStyle(
              //     fontSize: 18.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // Text(
              //   'Email',
              //   style: TextStyle(
              //     fontSize: 18.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // Text(
              //   'Vehicle',
              //   style: TextStyle(
              //     fontSize: 18.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Text(
                'Record',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // الجدول
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                    color: getBackgroundColor(i),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Text(
                          data[i]['nameController'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 5,
                          width: 16,
                        ),
                        Text(
                          data[i]['emailController'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                          width: 16,
                        ),
                        Text(
                          data[i]['ManufactureController'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Icon(
                            Icons.info_outline,
                            color: const Color.fromARGB(255, 1, 63, 114),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
}
 Color getBackgroundColor(int index) {
  if (index % 2 == 0) {
    return Color.fromARGB(255, 150, 177, 228)!;
  } else {
    return Color.fromARGB(255, 168, 167, 235);
  }
}