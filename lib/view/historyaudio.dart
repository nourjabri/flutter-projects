import 'dart:io';
import 'package:audioapp/service/service.dart';
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
      appBar: AppBar(title: const Text('التسجيلات السابقة')),
      body: recordings.isEmpty
          ? const Center(child: Text('لا توجد تسجيلات سابقة'))
          : ListView.builder(
              itemCount: recordings.length,
              itemBuilder: (context, index) {
                final file = recordings[index];
                final filename = file.path.split('/').last;

                return ListTile(
                    title: Text(filename),
                    trailing: IconButton(
                      icon: Icon(
                        playingFilePath == file.path
                            ? Icons.stop
                            : Icons.play_arrow,
                      ),
                      onPressed: () => playAudio(file.path),
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.cloud_upload),
                      onPressed: () async {
                        final text = await uploadAndTranscribe(file.path);

                        if (text != null) {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("النص المستخرج"),
                              content: Text(text),
                            ),
                          );
                        }
                      },
                    ));
              },
            ),
    );
  }
}
