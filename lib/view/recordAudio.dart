import 'dart:io';
import 'package:audioapp/view/historyaudio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class AudioRecorderScreen extends StatefulWidget {
  @override
  _AudioRecorderScreenState createState() => _AudioRecorderScreenState();
}

class _AudioRecorderScreenState extends State<AudioRecorderScreen> {
  AudioRecorder record = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();
  String? recordedFilePath;
  bool isRecording = false;
  bool isPlaying = false;

  Future<String> getRecordingPath(String fileName) async {
    final dir = await getApplicationDocumentsDirectory();

    final recordingsDir = Directory('${dir.path}/recordings');
    if (!await recordingsDir.exists()) {
      await recordingsDir.create(recursive: true);
    }

    return '${recordingsDir.path}/$fileName';
  }

  Future<void> startRecording() async {
    if (await record.hasPermission()) {
      final dir = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final path = '${dir.path}/recording_$timestamp.mp3';

      await record.start(
        const RecordConfig(
          // encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: path,
      );

      setState(() {
        isRecording = true;
        recordedFilePath = path;
      });
    }
  }

  Future<void> stopRecording() async {
    await record.stop();
    setState(() {
      isRecording = false;
    });
  }

  Future<void> playAudio() async {
    if (recordedFilePath == null) return;

    setState(() {
      isPlaying = true;
    });

    await audioPlayer.play(DeviceFileSource(recordedFilePath!));

    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
      });
    });
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    record.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تسجيل وتشغيل الصوت")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isRecording ? stopRecording : startRecording,
              child: Text(isRecording ? "إيقاف التسجيل" : "بدء التسجيل"),
            ),
            const SizedBox(height: 20),
            if (recordedFilePath != null && !isRecording) ...[
              ElevatedButton(
                onPressed: isPlaying ? stopAudio : playAudio,
                child: Text(isPlaying ? "إيقاف التشغيل" : "تشغيل الصوت"),
              ),
              const SizedBox(height: 10),
            ],
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HistoryAudios()),
                );
              },
              child: const Text('عرض التسجيلات السابقة'),
            ),
          ],
        ),
      ),
    );
  }
}
