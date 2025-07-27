import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/theme/colors.dart';

String? nihavalue;
DateTime? startDate;
DateTime? endDate;
String? durationvalue;
bool? isFajria;
int? numberOfPeople;

FloatingActionButton khtmasheet(BuildContext context) {
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
                    dropdownMenuEntries: <DropdownMenuEntry>[
                      DropdownMenuEntry(value: nihavalue, label: 'قضاءحاجة'),
                      DropdownMenuEntry(value: nihavalue, label: '  تفريج هم '),
                      DropdownMenuEntry(
                        value: nihavalue,
                        label: 'على روح مسلم',
                      ),
                      DropdownMenuEntry(value: nihavalue, label: 'شفاء مريض '),
                      DropdownMenuEntry(value: nihavalue, label: 'تيسير أمر '),
                    ],
                  ),
                  const SizedBox(height: 30),

                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2100),
                          );
                          // if (date != null) setState(() => startDate = date);
                        },
                        child: Text(
                          startDate == null
                              ? 'اختر تاريخ البداية'
                              : 'البداية: ${startDate!.toLocal().toString().split(" ")[0]}',
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: startDate ?? DateTime.now(),
                            firstDate: startDate ?? DateTime(2024),
                            lastDate: DateTime(2100),
                          );
                          // if (date != null) setState(() => endDate = date);
                        },
                        child: Text(
                          endDate == null
                              ? 'اختر تاريخ النهاية'
                              : 'النهاية: ${endDate!.toLocal().toString().split(" ")[0]}',
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
                    items: List.generate(30, (index) => index + 1).map((num) {
                      return DropdownMenuItem(
                        value: num,
                        child: Text('$num شخص'),
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("فجرية", style: TextStyle(fontSize: 16)),
                      Checkbox(
                        value: isFajria,
                        tristate: true,
                        semanticLabel: "فجرية",
                        onChanged: (value) {
                          setState() {
                            isFajria = value;
                          }
                        },
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
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
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("إضافة"),
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
