import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Pickerscreen extends StatelessWidget {
  final ValueNotifier<String> fileNameNotifier = ValueNotifier(
    "No file selected",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Pciker files", style: TextStyle(fontSize: 24)),
            InkWell(
              onTap: () {
                pickFile();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "please pick file from here",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                  Icon(Icons.add, color: Colors.lightBlueAccent),
                ],
              ),
            ),
            ValueListenableBuilder<String>(
              valueListenable: fileNameNotifier,
              builder: (context, value, child) {
                return Text("Selected: $value", style: TextStyle(fontSize: 16));
              },
            ),
          ],
        ),
      ),
    );
  }
}

void pickFile() async {
  String filepick = "";
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'doc'],
  );
  if (result != null && result.files.single.path != null) {
    PlatformFile file = result.files.first;

    filepick = file.name;
    print(filepick);
  }
}
