import 'package:flutter/material.dart';
import 'package:restaurant_mang/pages/config.dart';

class MyDrawer extends StatefulWidget {


  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return
     Drawer(
      child: ListView(
        children:<Widget> [
          UserAccountsDrawerHeader(accountName: Text("user1",style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),),
              accountEmail: Text("user1@user.com",style: TextStyle(
                color: Colors.grey
              ),),
            currentAccountPicture: GestureDetector(

              child: CircleAvatar(

                backgroundColor: secondryColor,
                child: Icon(Icons.person,color: fourColor,size: 28,
                  ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],

            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12, ),
            child: InkWell(
onTap: (){},
              child: Column(
                children: [
                  ListTile(
                    title: Text("Home", style: TextStyle(
                      fontSize: 18
                    ),),
                    leading: Icon(Icons.home,color: thirdColor,),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  ),
                ],
              ),

            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12, ),
            child: InkWell(
              onTap: (){},
              child: Column(
                children: [
                  ListTile(
                    title: Text("My Favorite", style: TextStyle(
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.favorite,color: thirdColor,),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  ),
                ],
              ),

            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12, ),
            child: InkWell(
              onTap: (){},
              child: Column(
                children: [
                  ListTile(
                    title: Text("My account", style: TextStyle(
                        fontSize: 18
                    ),),
                    leading: Icon(Icons.account_circle_rounded,color: thirdColor,),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  ),
                ],
              ),

            ),
          ),


        ],
      ),
    );
  }
}
