import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:otw4/model/item.dart';


class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('mohammed salem alawsh'),
                accountEmail: Text('mohammed salem alawsh@gmail'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'img/j.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'img/k.jpg',
                      ),
                      fit: BoxFit.cover),
                )),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('favorite'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('settings'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('About us'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('help'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {},
            ),
          ],
        ),
      ),
      
      appBar: AppBar(
        backgroundColor: Colors.white,
         iconTheme: IconThemeData(
          color: Colors.black, 
        ),
        title: Text('home',style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.white,
      
      bottomNavigationBar: CurvedNavigationBar(
        
        backgroundColor:Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          print(index);
        },
        
        items: [
        
        Icon(Icons.home,color: Colors.white,size: 33,),
        Icon(Icons.local_offer,color: Colors.white,size: 33,),
        Icon(Icons.location_on,color: Colors.white,size: 33,),
        Icon(Icons.favorite,color: Colors.white,size: 33),
        Icon(Icons.person,color: Colors.white,size: 33,),
        
      ]),
      body: Stack(children: [
        GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(14.503488, 49.062068),
          zoom: 14
          
           
        )
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Color.fromARGB(221, 56, 52, 52),
            width: 400,
            height: 250,
            child: Column(
              children: [
                SizedBox(height: 5,),
                Text(' Plan your ride',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                 Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 115)),
                Icon(Icons.location_on, color:Colors.white, size: 15,),
                SizedBox(width: 10,),
                InkWell(onTap: () {},
                child: Text('From' ,style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
                SizedBox(width: 10,),
                Icon(Icons.arrow_downward, color:Colors.white, size: 20,),
                Container(
                  
                  padding: EdgeInsets.only(left: 5),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    padding:EdgeInsets.only(left: 10,top: 3,bottom: 3,right: 15),
                    
                    onPressed: () {},
                  child: Text(" My location ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0,),
                 Row(
              children: [
                 Padding(padding: EdgeInsets.only(left: 115)),
                Icon(Icons.location_on, color:Colors.white, size: 15,),
                SizedBox(width: 10,),
                InkWell(onTap: () {},
                child: Text('   To  ' ,style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
                Container(
                  
                  padding: EdgeInsets.only(left: 35),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                   padding:EdgeInsets.only(left: 10,top: 3,bottom: 3,right: 15),
                    
                    onPressed: () {},
                  child: Text("  Ibn-Sina ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
             Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 108)),
                InkWell(onTap: () {},
                child: Text(' Type of Vehicle' ,style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
                Container(
                  
                  padding: EdgeInsets.only(left: 30),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    padding:EdgeInsets.only(left: 10,top: 3,bottom: 3,right: 15),
                    
                    onPressed: () {},
                  child: Row(
                    children: [
                      Text(" Car ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      Icon(Icons.keyboard_arrow_right, color:Colors.black, size: 15,),

                    ],
                  )
                  ),
                ),
              ],
            ),
            MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    padding:EdgeInsets.only(left: 10,top: 3,bottom: 3,right: 15),
                    
                    onPressed: () {},
                  child: Text(" My location ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                  ),

              ],
            ),
          ),
        )
      ],)

    );
  }
}
