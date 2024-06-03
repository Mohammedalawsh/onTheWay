import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class home_sreen extends StatefulWidget {
  const home_sreen({super.key});

  @override
  State<home_sreen> createState() => _home_sreenState();
}

class _home_sreenState extends State<home_sreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // خانة العنوان العلوي
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Text in top left'),
                Text('Text in top right'),
              ],
            ),
            SizedBox(height: 25.0),
            
            // خانة الصور الكبيرة
            Container(
              width: 330.0,
              height: 190.0,
            child: ClipRRect(
            
            borderRadius: BorderRadius.circular(40),
            child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const map()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Row(children: [
                        
            Image.asset('img/car1.jpg',fit: BoxFit.cover,),
                        
                        
                        Positioned(top: 137,left: 56,right: 0,child: Container(
                          
                          padding: EdgeInsets.only(left: 40),
                          child: Text('mail>>>',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                        ),)
                        
                      ],),
                    ),
            ),
                            ),
            ),
            // SizedBox(height: 10.0),
            
            // خانة الصور الصغيرة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                
                Container(
                  width: 250,
                  height: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.network('https://via.placeholder.com/150',fit: BoxFit.fitWidth,),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              // gradient: LinearGradient(
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              //   colors: [
                              //     Colors.transparent,
                              //     Colors.black.withOpacity(0.5),
                              //   ],
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    // SizedBox(width: 15,),
    Container(
      width: 250,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Image.network('https://via.placeholder.com/150',fit: BoxFit.fill,),
            
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   // colors: [
                  //   //   Colors.transparent,
                  //   //   Colors.black.withOpacity(0.5),
                  //   // ],
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
            Row(
              children: [
                // Expanded(
                //   child: Column(
                //     children: [
                //       Image.asset('img/car1.jpg',width: 180,height: 180,),
                //       // SizedBox(height: 8.0),
                //       Image.asset('img/car1.jpg',width: 180,height: 180,),
                //     ],
                //   ),
                // ),
                // SizedBox(width: 16.0),
                // Expanded(
                //   child: Column(
                //     children: [
                //       Image.asset('img/car1.jpg',width: 180,height: 180,),
                //       // SizedBox(height: 8.0),
                //       Image.asset('img/car1.jpg',width: 180,height: 180,),
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ),]
      ),
    ));
  }
  }