import 'package:flutter/material.dart';
import 'package:resturant_mang/Core/constants/config.dart';

Widget  drawer(){ 
  return  ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text(
              "user1",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            accountEmail: const Text(
              "user1@user.com",
              style: TextStyle(color: Colors.grey),
            ),
            currentAccountPicture: GestureDetector(
              child: const CircleAvatar(
                backgroundColor: secondryColor,
                child: Icon(
                  Icons.person,
                  color: fourColor,
                  size: 28,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      "Home",
                      style: TextStyle(fontSize: 18),
                    ),
                    leading: Icon(
                      Icons.home,
                      color: thirdColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      "My Favorite",
                      style: TextStyle(fontSize: 18),
                    ),
                    leading: Icon(
                      Icons.favorite,
                      color: thirdColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      "My account",
                      style: TextStyle(fontSize: 18),
                    ),
                    leading: Icon(
                      Icons.account_circle_rounded,
                      color: thirdColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  ),
                ],
              ),
            ),
          ),
        ],
      
    );
}