import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/theme/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BottomInfromation extends StatefulWidget {
  const BottomInfromation({super.key});

  @override
  State<BottomInfromation> createState() => _BottomInfromationState();
}

class _BottomInfromationState extends State<BottomInfromation> {
  String? nihavalue;
  DateTime? startDate;
  DateTime? endDate;
  String? durationvalue;
  bool isFajria = false;
  int? numberOfPeople;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Appcolor().sixcolor,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          backgroundColor: Appcolor().sixcolor,
          builder: (context) {
            return Container(
              width: 400.w,
              height: 600.h,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "النية",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                    DropdownMenu(
                      textStyle: TextStyle(color: Appcolor().sevencolor),
                      dropdownMenuEntries: <DropdownMenuEntry>[
                        DropdownMenuEntry(value: nihavalue, label: 'قضاءحاجة'),
                        DropdownMenuEntry(
                          value: nihavalue,
                          label: '  تفريج هم ',
                        ),
                        DropdownMenuEntry(
                          value: nihavalue,
                          label: 'على روح مسلم',
                        ),
                        DropdownMenuEntry(
                          value: nihavalue,
                          label: 'شفاء مريض ',
                        ),
                        DropdownMenuEntry(
                          value: nihavalue,
                          label: 'تيسير أمر ',
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "مدة الختمة",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final pickedStart = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );

                            if (pickedStart != null) {
                              final pickedEnd = await showDatePicker(
                                context: context,
                                initialDate: pickedStart.add(Duration(days: 1)),
                                firstDate: pickedStart,
                                lastDate: DateTime(2100),
                              );

                              if (pickedEnd != null) {
                                setState(() {
                                  startDate = pickedStart;
                                  endDate = pickedEnd;
                                });
                              }
                            }
                          },
                          child: Container(
                            width: 266.w,
                            height: 40.h,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              startDate != null && endDate != null
                                  ? 'من ${startDate!.toLocal().toString().split(' ')[0]} إلى ${endDate!.toLocal().toString().split(' ')[0]}'
                                  : '  ',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),

                    DropdownButton<int>(
                      hint: const Text('اختر عدد الأشخاص'),
                      value: numberOfPeople,
                      onChanged: (value) {
                        // setState()(() {
                        //   numberOfPeople = value;
                        // });
                      },
                      items: List.generate(5, (index) => index + 1).map((num) {
                        return DropdownMenuItem(
                          value: num,
                          child: Text('$num شخص'),
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isFajria,
                          tristate: true,
                          activeColor: Colors.white,
                          checkColor: Appcolor().sevencolor,
                          onChanged: (value) {
                            // setState(() {
                            //   isFajria = value!;
                            // });
                          },
                        ),
                        Text(
                          "فجرية",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Container(
                        width: 123.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Appcolor().firstcolor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "مشاركة",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.share, color: Colors.white),
                          ],
                        ),
                      ),
                    ),

                    MaterialButton(
                      onPressed: () async {
                        final userId =
                            Supabase.instance.client.auth.currentUser?.id;

                        final response = await Supabase.instance.client
                            .from('public_khatmas')
                            .insert({
                              'niyyah': nihavalue,
                              'start_date': startDate?.toIso8601String(),
                              'end_date': endDate?.toIso8601String(),
                              'people_count': numberOfPeople,
                              'is_fajria': isFajria,
                              'created_by': userId,
                            })
                            .select();

                        if (response != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تمت إضافة الختمة بنجاح')),
                          );

                          setState(() {
                            startDate = null;
                            endDate = null;
                            isFajria = false;
                          });
                        }
                      },

                      child: Container(
                        width: 266.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Appcolor().sevencolor,
                        ),
                        child: Center(
                          child: Text(
                            "إضافة",
                            style: TextStyle(
                              color: Appcolor().sixcolor,
                              fontFamily: "H-ALHFHAF",
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Icon(Icons.add, color: Appcolor().sevencolor),
    );
  }
}
