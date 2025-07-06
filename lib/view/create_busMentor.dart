import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/model/busmonetormddel.dart';
import 'package:adminapp/service/busmentor_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateBusMentoscreen extends StatefulWidget {
  const CreateBusMentoscreen({super.key});

  @override
  State<CreateBusMentoscreen> createState() => _CreateBusMentoscreenState();
}

class _CreateBusMentoscreenState extends State<CreateBusMentoscreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Create Bus Mentor",
                  style: TextStyle(
                    color: AppColor.primarycolor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: 100.h,
                  height: 100.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/teacher.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              onChanged: (value) {},

              decoration: InputDecoration(
                label: Text("Please Add the user name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: phoneController,
              onChanged: (value) {},

              decoration: InputDecoration(
                label: Text("Please Add the phone number"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: roleController,
              decoration: InputDecoration(
                label: Text("Please spicify the role"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                label: Text("Please enter the password"),
              ),
            ),
          ),
          SizedBox(height: 50),
          MaterialButton(
            onPressed: () async {
              final mentor = BusMonetorModel(
                username: nameController.text,
                phone_number: phoneController.text,
                id: 0,

                role: roleController.text,
                is_active: true,
              );
              bool status = await BusMentorService().creatementorservice(
                mentor,
              );
              if (status) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("yes")));
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Noo")));
              }
            },
            child: Container(
              height: 54.h,
              width: 115.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [AppColor.primarycolor, AppColor.secondycolor],
                ),
              ),
              child: Center(
                child: Text(
                  "Create Bus Mentor Account",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
