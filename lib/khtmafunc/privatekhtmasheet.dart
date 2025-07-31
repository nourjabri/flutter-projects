import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:serapp/theme/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivatekhtmaSheet extends StatefulWidget {
  const PrivatekhtmaSheet({super.key});

  @override
  State<PrivatekhtmaSheet> createState() => _PrivatekhtmaSheetState();
}

class _PrivatekhtmaSheetState extends State<PrivatekhtmaSheet> {
  String? nihavalue;
  DateTime? startDate;
  DateTime? endDate;
  String? durationvalue;
  bool isFajria = false;

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

                    DropdownMenu<String>(
                      initialSelection: nihavalue,
                      onSelected: (String? value) {
                        setState(() {
                          nihavalue = value;
                        });
                      },
                      textStyle: TextStyle(color: Appcolor().sevencolor),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 'قضاءحاجة', label: 'قضاءحاجة'),
                        DropdownMenuEntry(value: 'تفريج هم', label: 'تفريج هم'),
                        DropdownMenuEntry(
                          value: 'على روح مسلم',
                          label: 'على روح مسلم',
                        ),
                        DropdownMenuEntry(
                          value: 'شفاء مريض',
                          label: 'شفاء مريض',
                        ),
                        DropdownMenuEntry(
                          value: 'تيسير أمر',
                          label: 'تيسير أمر',
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
                            height: 50.h,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              startDate != null && endDate != null
                                  ? 'من ${DateFormat('yyyy/MM/dd').format(startDate!)} إلى ${DateFormat('yyyy/MM/dd').format(endDate!)}'
                                  : '',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('فجرية', style: TextStyle(color: Colors.white)),
                    Checkbox(
                      value: isFajria,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isFajria = newValue ?? false;
                        });
                      },
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        Set<WidgetState> states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return Appcolor().secondcolor;
                        }
                        return Colors.white;
                      }),
                      checkColor: Appcolor().secondcolor,
                    ),

                    MaterialButton(
                      onPressed: () async {
                        final userId =
                            Supabase.instance.client.auth.currentUser?.id;
                        if (nihavalue == null ||
                            startDate == null ||
                            endDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('يرجى تعبئة جميع الحقول')),
                          );
                          return;
                        }

                        final response = await Supabase.instance.client
                            .from('private_khatmas')
                            .insert({
                              'niyyah': nihavalue,
                              'start_date': startDate?.toString(),
                              'end_date': endDate?.toString(),

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
                        int durationInDays =
                            endDate!.difference(startDate!).inDays + 1;
                        distributeAndShareParts(context, durationInDays);
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

void distributeAndShareParts(BuildContext context, int duration) {
  final int totalParts = 30;

  List<String> parts = [];
  for (int i = 0; i < totalParts; i++) {
    int part = (i % duration) + 1;
    parts.add('الجزء ${i + 1} -> الشخص رقم $part');
  }

  String message = '📖 توزيع أجزاء الختمة:\n\n' + parts.join('\n');

  final Uri whatsappUri = Uri.parse(
    'https://wa.me/?text=${Uri.encodeComponent(message)}',
  );
  launchUrl(whatsappUri);
}
