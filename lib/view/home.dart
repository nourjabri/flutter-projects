import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';


const String assemblyApiKey = 'YOUR_ASSEMBLYAI_API_KEY'; // Replace with your key

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Record _recorder = Record(); // ✅ Correct usage
  bool _isRecording = false;
  String _transcript = '';
  String? _audioPath;
  final Dio _dio = Dio();

  Future<void> _startRecording() async {
    final micStatus = await Permission.microphone.request();
    if (!micStatus.isGranted) {
      print('Microphone permission denied');
      return;
    }

    final dir = await getApplicationDocumentsDirectory();
    _audioPath = p.join(dir.path, 'recording.wav');

    await _recorder.start(
      path: _audioPath,
      encoder: AudioEncoder.wav,
      bitRate: 128000,
      samplingRate: 44100,
    );

    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _stopRecordingAndTranscribe() async {
    final path = await _recorder.stop();
    setState(() => _isRecording = false);

    if (path == null) {
      print("Recording failed or was cancelled.");
      return;
    }

    final file = File(path);
    final uploadUrl = await _uploadAudio(file);
    final result = await _transcribe(uploadUrl);

    setState(() {
      _transcript = result;
    });
  }

  Future<String> _uploadAudio(File file) async {
    try {
      final response = await _dio.post(
        'https://api.assemblyai.com/v2/upload',
        data: file.openRead(),
        options: Options(
          headers: {
            'authorization': assemblyApiKey,
            'transfer-encoding': 'chunked',
          },
          contentType: 'application/octet-stream',
        ),
      );
      return response.data['upload_url'];
    } catch (e) {
      print('Upload error: $e');
      rethrow;
    }
  }

  Future<String> _transcribe(String audioUrl) async {
    try {
      final response = await _dio.post(
        'https://api.assemblyai.com/v2/transcript',
        data: jsonEncode({'audio_url': audioUrl}),
        options: Options(
          headers: {
            'authorization': assemblyApiKey,
            'content-type': 'application/json',
          },
        ),
      );

      final transcriptId = response.data['id'];

      // Polling until done
      while (true) {
        final polling = await _dio.get(
          'https://api.assemblyai.com/v2/transcript/$transcriptId',
          options: Options(headers: {'authorization': assemblyApiKey}),
        );

        final status = polling.data['status'];
        if (status == 'completed') {
          return polling.data['text'];
        } else if (status == 'error') {
          return '❌ Transcription failed.';
        }
        await Future.delayed(const Duration(seconds: 2));
      }
    } catch (e) {
      print('Transcription error: $e');
      return 'Error while transcribing';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🎙️ Audio to Text")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _isRecording ? _stopRecordingAndTranscribe : _startRecording,
              child: Text(_isRecording ? '🛑 Stop & Transcribe' : '🎤 Start Recording'),
            ),
            const SizedBox(height: 20),
            const Text("📝 Transcribed Text:"),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_transcript.isEmpty ? 'No transcription yet.' : _transcript),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
