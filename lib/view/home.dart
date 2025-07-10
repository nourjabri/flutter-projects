import 'dart:io';

import 'package:Firey/main.dart';
import 'package:Firey/model/chat_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController messageController;
  List<ChatModel> tempchat = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat App")),
      body: Center(
        child: Column(
          children: [
            StreamBuilder(
              stream: supabase.client.from('chat').stream(primaryKey: ['id']),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ChatModel> chats = List.generate(
                    snapshot.data!.length,
                    (index) => ChatModel.fromMap(snapshot.data![index]),
                  );
                  tempchat = chats;
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        if (tempchat[index].is_me) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color:
                                  tempchat[index] == chats[index]
                                      ? Colors.pinkAccent
                                      : Colors.amberAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              tempchat[index].message,
                              style: TextStyle(fontSize: 26),
                            ),
                          );
                        } else {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(color: Colors.blue),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              tempchat[index].message,
                              style: TextStyle(fontSize: 26),
                            ),
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return LinearProgressIndicator();
                }
              },
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async {
                            final result = await FilePicker.platform.pickFiles(
                              type: FileType.image,
                            );
                            if (result != null) {
                              supabase.client.storage
                                  .from('image')
                                  .upload(
                                    result.files.first.name,
                                    File(result.files.first.path!),
                                  );
                            }
                          },
                          icon: Icon(Icons.attach_file, color: Colors.purple),
                        ),
                        hintText: 'Enter your message',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      tempchat.add(
                        ChatModel(message: messageController.text, is_me: true),
                      );
                      await supabase.client.from('chat').insert({
                        'message': messageController.text,
                        'is_me': true,
                      });
                      messageController.clear();
                    setState(() {
                      
                    });
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
