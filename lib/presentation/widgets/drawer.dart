import 'package:flutter/material.dart';
import 'package:resturant_mang/Core/constants/config.dart';

Widget drawer() {
  return SizedBox(
    child: ListView(
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
      ],
    ),
  );
}
