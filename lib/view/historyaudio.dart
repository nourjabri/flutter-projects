import 'dart:io';
import 'package:audioapp/mainbuttons/colors.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';

class HistoryAudios extends StatefulWidget {
  @override
  _HistoryAudiosState createState() => _HistoryAudiosState();
}

class _HistoryAudiosState extends State<HistoryAudios> {
  List<FileSystemEntity> recordings = [];
  final AudioPlayer audioPlayer = AudioPlayer();
  String? playingFilePath;

  @override
  void initState() {
    super.initState();
    loadRecordings();
  }

  Future<void> loadRecordings() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync().where((file) {
      return file.path.endsWith('.mp3') || file.path.endsWith('.wav');
    }).toList();

    setState(() {
      recordings = files;
    });
  }

  Future<void> playAudio(String path) async {
    if (playingFilePath == path) {
      await audioPlayer.stop();
      setState(() {
        playingFilePath = null;
      });
    } else {
      await audioPlayer.play(DeviceFileSource(path));
      setState(() {
        playingFilePath = path;
      });

      audioPlayer.onPlayerComplete.listen((event) {
        setState(() {
          playingFilePath = null;
        });
      });
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'التسجيلات السابقة',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Appcolor().secondrcolor,
      ),
      body: recordings.isEmpty
          ? const Center(child: Text('لا توجد تسجيلات سابقة'))
          : ListView.builder(
              itemCount: recordings.length,
              itemBuilder: (context, index) {
                final file = recordings[index];
                final filename = file.path.split('/').last;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text('$filename+ $index'),
                      leading: IconButton(
                        icon: Icon(
                          playingFilePath == file.path
                              ? Icons.stop
                              : Icons.play_arrow,
                        ),
                        onPressed: () => playAudio(file.path),
                      ),
                      trailing: IconButton(
                          onPressed: () async {
                            final deletedrecord = File(file.path);
                            if (await deletedrecord.exists()) {
                              await deletedrecord.delete();
                              await loadRecordings();
                              setState(() {});
                            }
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
