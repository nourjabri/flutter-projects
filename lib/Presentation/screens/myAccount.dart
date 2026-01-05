import 'package:fashionproject/Presentation/screens/widgets/logout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyaccountScreen extends StatelessWidget {
  const MyaccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Account ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: CircleAvatar(),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ahmad Darkal "),
                  Text("Ahmaddar88@gmail.com "),
                ],
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_outlined),
              ),
            ),
            Divider(thickness: 2),
            Logout(
              
            ),
          ],
        ),
      ),
    );
  }
}
