import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:serapp/theme/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PubliczikarSheet extends StatefulWidget {
  const PubliczikarSheet({super.key});

  @override
  State<PubliczikarSheet> createState() => _PubliczikarSheetState();
}

class _PubliczikarSheetState extends State<PubliczikarSheet> {
  String? nihavalue;
  DateTime? startDate;
  DateTime? endDate;
  String? durationvalue;
  bool isFajria = false;
  int? numberOfPeople;
  String? peoplenames;

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
                        DropdownMenuEntry(
                          value: 'صلاة عالنبي ',
                          label: 'صلاة عالنبي ',
                        ),
                        DropdownMenuEntry(value: 'استغفار ', label: 'استغفار '),
                        DropdownMenuEntry(value: 'حوقلة', label: 'حوقلة'),
                        DropdownMenuEntry(value: 'تكبير', label: 'تكبير'),
                        DropdownMenuEntry(value: 'تسبيح', label: 'تسبيح'),
                        DropdownMenuEntry(value: 'بسملة  ', label: ' بسملة'),
                        DropdownMenuEntry(value: 'تهليل ', label: 'تهليل '),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "مدة الذكر",
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
                        Text("العدد المفروض"),
                        Slider(value: 300, onChanged: ValueKey.new),
                      ],
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
                            .from('public_khatmas')
                            .insert({
                              'niyyah': nihavalue,
                              'start_date': startDate?.toString(),
                              'end_date': endDate?.toString(),
                              'people_count': numberOfPeople,
                              'is_fajria': isFajria,
                              'created_by': userId,
                              'peoplename': peoplenames,
                            })
                            .select()
                            .single();
                        final khatmaId = response['id'];
                        final List<String> names = peoplenames
                            .toString()
                            .split(',')
                            .map((e) => e.trim())
                            .toList();
                        for (final name in names) {
                          await Supabase.instance.client
                              .from('khatma_people')
                              .insert({'name': name, 'khatma_id': khatmaId});
                        }

                        if (response != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تمت إضافة الذكر بنجاح')),
                          );

                          setState(() {
                            startDate = null;
                            endDate = null;
                            isFajria = false;
                          });
                        }
                        showDialog(
                          context: context,
                          builder: (context) {
                            TextEditingController peopleController =
                                TextEditingController();
                            TextEditingController peoplename =
                                TextEditingController();

                            return AlertDialog(
                              title: Text(' عدد الأشخاص'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(' عدد الأشخاص '),
                                  SizedBox(height: 10),
                                  TextField(
                                    controller: peopleController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  Text("اسماء الاشخاص"),
                                  TextField(
                                    controller: peoplename,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('إلغاء'),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    final count = int.tryParse(
                                      peopleController.text,
                                    );

                                    final names = peoplename.text;
                                    if (count != null &&
                                        count > 0 &&
                                        names.isNotEmpty) {
                                      names
                                          .split(',')
                                          .map((e) => e.trim())
                                          .toList();
                                      if (names.length != count) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "عدد الاسماء لا يطابق عدد الاشخاص المدخل",
                                            ),
                                          ),
                                        );
                                      }
                                      Navigator.of(context).pop();
                                      final khatmaId = response['id'];
                                      for (final name in [names]) {
                                        await Supabase.instance.client
                                            .from('public_khatmas')
                                            .insert({
                                              'peoplename': name,
                                              'khatma_id': khatmaId,
                                            });
                                      }

                                      if (mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'تم حفظ الأشخاص بنجاح',
                                            ),
                                          ),
                                        );
                                      }
                                      int durationInDays =
                                          endDate!
                                              .difference(startDate!)
                                              .inDays +
                                          1;

                                      // generateWhatsAppMessages([
                                      //   names,
                                      // ], durationInDays);
                                    }
                                  },
                                  child: Text('توزيع ومشاركة'),
                                ),
                              ],
                            );
                          },
                        );
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

// void generateWhatsAppMessages(List<String> names, int numberOfDays) {
//   const totalParts = 30;
//   int peopleCount = names.length;
//   int partsPerPerson = (totalParts / peopleCount).ceil();

//   for (int i = 0; i < names.length; i++) {
//     int startPart = (i * partsPerPerson) + 1;
//     int endPart = ((i + 1) * partsPerPerson);
//     if (endPart > totalParts) endPart = totalParts;

//     String message =
//         '''
// السلام عليكم ${names[i]} 🌸

// تم تخصيص الاعداد التالية من الذكر :

// 📖 من الجزء ${startPart} من ع\\ ${endPart}

// 📅 عدد أيام الختمة: $numberOfDays يوم

// 📢 سيتم إرسال تذكير يومي بقراءتك بإذن الله

// جزاك الله كل خير 💚
// ''';

//     print(Uri.encodeFull("https://wa.me/?text=$message"));
//   }
// }
