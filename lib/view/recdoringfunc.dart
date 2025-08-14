import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

AudioRecorder record = AudioRecorder();
final AudioPlayer audioPlayer = AudioPlayer();

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

Future<String?> startRecording() async {
  if (await record.hasPermission()) {
    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final path = '${dir.path}/recording_$timestamp.mp3';

    await record.start(
      const RecordConfig(
        bitRate: 128000,
        sampleRate: 44100,
      ),
      path: path,
    );
    print("nour record");
    return path;
  }
  return null;
}

Future<bool> stopRecording() async {
  await record.stop();
  return false;
}

Future<bool> playAudio(String? filePath) async {
  if (filePath == null) return false;

  await audioPlayer.play(DeviceFileSource(filePath));

  return true;
}

Future<bool> stopAudio() async {
  await audioPlayer.stop();
  return false;
}

void disposeControllers() {
  record.dispose();
  audioPlayer.dispose();
}
