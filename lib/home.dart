import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zamazam/theme/appcolor.dart';

class Home extends StatelessWidget {
  late TextEditingController searchcontroller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 188.h,
            width: 375.w,
            decoration: BoxDecoration(color: AppColors.primary),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: AppColors.headlineTextColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Text(
                    "Mr Product!",
                    style: TextStyle(
                      color: AppColors.headlineTextColor,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.r,
                    right: 10.r,
                    top: 16.r,
                    bottom: 16.r,
                  ),
                  child: TextField(
                    controller: searchcontroller,
                    decoration: InputDecoration(
                      labelText: "Search Something...",
                      labelStyle: TextStyle(color: AppColors.headlineTextColor),
                      border: OutlineInputBorder(),
                      //  prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 161.h,
                  child: PageView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(21),
                        margin: EdgeInsets.only(left: 10.r, right: 10.r),
                        width: 355.w,
                        height: 141.h,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/Mask.png"),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Drips Spring",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.headlineTextColor,
                              ),
                            ),
                            Text(
                              "Bottle water delivery",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.headlineTextColor,
                              ),
                            ),
                            Spacer(flex: 2),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFFC33A),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Quick shop",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Water type",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder:
                        (context, index) => Padding(
                          padding: EdgeInsets.only(left: 8.r),
                          child: Chip(label: Text("item $index")),
                        ),
                  ),
                ),

                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder:
                      (context, index) =>
                          Container(child: Column(children: [Text("")])),
                  itemCount: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
