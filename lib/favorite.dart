import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:otw1/Services.dart';

class  favorites  extends StatefulWidget {
  const  favorites ({super.key});

  @override
  State< favorites > createState() => _favoritesState();
}

class _favoritesState extends State< favorites > {
  @override
  Widget build(BuildContext context) {
    return Scaffold ( drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.red,
            child: Text("www",style: TextStyle(color: Colors.white),),),
            accountName: Text("ahmed"), 
          accountEmail: Text("ahmedawad71317@gmail.com")),
          ListTile(
            title: Text("HomePage"),
            leading: Icon(Icons.home),
            onTap: () {
              
            },
          ),
          ListTile(
            title: Text("Serivers"),
            leading: Icon(Icons.room_service),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Services();
              }));
            },
          ),
          ListTile(
            title: Text("Map"),
            leading: Icon(Icons.compass_calibration_sharp),
            onTap: () {
              
            },
          ),
          ListTile(
            title: Text("Favorite"),
            leading: Icon(Icons.favorite),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return  favorites();
              }));
            },
          ),
          ListTile(
            title: Text("Account"),
            leading: Icon(Icons.settings),
            onTap: () {
              
            },
          ),

        ],),
      ),

      appBar: AppBar(title: Text("ON THE WAY"),
      ),
      
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

      body:Container(margin: EdgeInsets.only(left: 10),
         decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10)
            ),
        child: Column(
          
          children: [
            SizedBox(height: 10,),
             Container( margin: EdgeInsets.only(left: 10),
             
           
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10)
              ),
              
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: EdgeInsets.only(left: 10),
                    child: Text("Favorite places",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ],
              )),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 200,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10)
              ),
        
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child:Row(children: [
                      SizedBox(width: 10,),
                      Container(child: Icon(Icons.location_city,
                      color: Colors.white,),),
                  SizedBox(width: 20,),
                  Container(child: Text("Mukalla, Fuwwah\nAhmed Yaseen Street",
                  style: TextStyle(color:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),),
                ),
                 SizedBox(height: 20,width: 10,),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: ElevatedButton(onPressed: (){}, child: Text("Get")),
                ),
                  ],)
                  
                ),
              
                SizedBox(height: 20,),
                 Container(
                  margin: EdgeInsets.only(left: 10),
                  child:Row(children: [
                      SizedBox(width: 10,),
                      Container(child: Icon(Icons.bus_alert,
                      color: Colors.white,),),
                  SizedBox(width: 20,),
                  Container(child: Text("Mukalla, Ibn Sina\n Al-Burikie Store",
                  style: TextStyle(color: Colors.white, 
                   fontWeight: FontWeight.bold,fontSize: 16),),
                ),
                 SizedBox(height: 20,width: 45,),
                Container(child: ElevatedButton(onPressed: (){}, child: Text("Get")),
                ),
                  ],), 
                  
                ),
                SizedBox(height: 20,),
                 Container(
                  margin: EdgeInsets.only(left: 10),
                  child:Row(children: [
                      SizedBox(width: 10,),
                      Container(child: Icon(Icons.motorcycle,
                      color: Colors.white,),),
                  SizedBox(width: 20,),
                  Container(child:
                   Text("Al-Shrge\n Al-Salam Mall",
                   style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,fontSize: 16),),
                    
                ),
                SizedBox(height: 20,width: 65,),
                Container(child: ElevatedButton(onPressed: (){}, child: Text("Get")),
                ),
        
                  ],)
                  
                ),
                
              ],)
            ),
            SizedBox(height: 20,),
            Container( margin: EdgeInsets.only(left: 10),
           
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10)
              ),
              
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: EdgeInsets.only(left: 10),
                    child: Text("Favorite drivers",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ],
              )),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 200,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10)
              ),
        
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child:Row(children: [
                      SizedBox(width: 10,),
                      Container(child: Icon(Icons.person,
                      color: Colors.white,),),
                  SizedBox(width: 5,),
                  Container(child: Text("Mohammed Abdullah Bin Bishr",
                  style: TextStyle(color:Colors.white, 
                  fontWeight: FontWeight.bold,
                  fontSize: 13),),
                ),
                 SizedBox(height: 20,width: 10,),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: ElevatedButton(onPressed: (){}, child: Text("Get"),
                  ),
                ),
                
                
                
                
                  ],
                  ) 
                ),
                SizedBox(height: 10,),
                Container(margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                Container(child: Icon(Icons.person,
                      color: Colors.white,),),
                SizedBox(width: 10,),
                  Container(child: Text("Mohammed Salem Alawsh",
                  style: TextStyle(color:Colors.white, 
                  fontWeight: FontWeight.bold,
                  fontSize: 15),),
                ),
                SizedBox(width: 10,),
                 Container(
                  margin: EdgeInsets.only(top: 5),
                  child: ElevatedButton(onPressed: (){}, child: Text("Get"),
                  ),
                ),],
                ),),
                SizedBox(height: 10,),
                 Container(margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                Container(child: Icon(Icons.person,
                      color: Colors.white,),),
                SizedBox(width: 10,),
                  Container(child: Text("Ahmed Awad Bin Gobah",
                  style: TextStyle(color:Colors.white, 
                  fontWeight: FontWeight.bold,
                  fontSize: 15),),
                ),
                SizedBox(width: 25,),
                 Container(
                  margin: EdgeInsets.only(top: 5),
                  child: ElevatedButton(onPressed: (){}, child: Text("Get"),
                  ),
                ),],
                ),)
                
               
                
                
                
          ]))

          ],
        ),
      )
    );
  }
}