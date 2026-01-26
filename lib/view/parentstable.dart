import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/model/parent_model.dart';
import 'package:flutter/material.dart';

DataTable ParentsTable(List<ParentModel> Parents) {
  return DataTable(
    columns: [
      DataColumn(
        label: Text(
          "Parent Id",
          style: TextStyle(color: AppColor.secondycolor),
        ),
      ),
      DataColumn(
        label: Text("Name", style: TextStyle(color: AppColor.secondycolor)),
      ),
      DataColumn(
        label: Text("Role", style: TextStyle(color: AppColor.secondycolor)),
      ),
      DataColumn(
        label: Text("Phone", style: TextStyle(color: AppColor.secondycolor)),
      ),
    ],
    rows:
        Parents.map((parent) {
          return DataRow(
            cells: [
              DataCell(Text(parent.id.toString())),
              DataCell(Text(parent.username)),
              DataCell(Text(parent.role)),
              DataCell(Text(parent.phone_number)),
            ],
          );
        }).toList(),
  );
}
