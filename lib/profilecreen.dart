import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.search),
                      ),
                      Text(
                        "Presonal Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ),
                Positioned(left: 150, top: 90, child: FlutterLogo(size: 80)),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'User full Name',
                prefixIcon: Icon(Icons.person, color: Colors.orange),
                suffixIcon: Icon(Icons.edit),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                hintText: 'User full Name',
                prefixIcon: Icon(Icons.date_range, color: Colors.orange),
                suffixIcon: Icon(Icons.edit_attributes_outlined),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                hintText: 'user@gmail.com',
                prefixIcon: Icon(Icons.email_outlined, color: Colors.orange),
                suffixIcon: Icon(Icons.edit_attributes_outlined),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                hintText: 'Edit your password',
                prefixIcon: Icon(Icons.key_off_outlined, color: Colors.orange),
                suffixIcon: Icon(Icons.edit_attributes_outlined),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.logout, color: Colors.orange),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("log out"),
                          content: Container(
                            height: 80,
                            width: 150,
                            child: Column(
                              children: [
                                Text("are you sure you want to logout "),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {},
                                      child: Text("no, thank you"),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {},
                                      child: Text("log out"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "LOG OUT",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
