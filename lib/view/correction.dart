import 'dart:convert';

import 'package:flutter/services.dart';

String normalizeArabic(String s) {
  s = s.toLowerCase();

  s = s.replaceAll(RegExp(r'[\u064B-\u0652\u0670\u06D6-\u06ED]'), '');

 
  s = s.replaceAll(RegExp(r'[إأآ]'), 'ا');
  s = s.replaceAll('ى', 'ي');
  s = s.replaceAll('ؤ', 'و');
  s = s.replaceAll('ئ', 'ي');


  s = s.replaceAll(RegExp(r'[^\u0600-\u06FF0-9\s]'), ' ');


  s = s.replaceAll(RegExp(r'\s+'), ' ').trim();

  return s;
}

int levenshtein(String s, String t) {
  if (s == t) return 0;
  if (s.isEmpty) return t.length;
  if (t.isEmpty) return s.length;

  final m = s.length;
  final n = t.length;
  final dp = List.generate(m + 1, (_) => List<int>.filled(n + 1, 0));

  for (int i = 0; i <= m; i++) dp[i][0] = i;
  for (int j = 0; j <= n; j++) dp[0][j] = j;

  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      final cost = s[i - 1] == t[j - 1] ? 0 : 1;
      dp[i][j] = [
        dp[i - 1][j] + 1, 
        dp[i][j - 1] + 1, 
        dp[i - 1][j - 1] + cost 
      ].reduce((a, b) => a < b ? a : b);
    }
  }
  return dp[m][n];
}

int levenshteinList(List<String> a, List<String> b) {
  final m = a.length;
  final n = b.length;
  final dp = List.generate(m + 1, (_) => List<int>.filled(n + 1, 0));
  for (int i = 0; i <= m; i++) dp[i][0] = i;
  for (int j = 0; j <= n; j++) dp[0][j] = j;

  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      final same = a[i - 1] == b[j - 1];
      dp[i][j] = [
        dp[i - 1][j] + 1,
        dp[i][j - 1] + 1,
        dp[i - 1][j - 1] + (same ? 0 : 1)
      ].reduce((x, y) => x < y ? x : y);
    }
  }
  return dp[m][n];
}

double similarityPercentByWords(String s1, String s2) {
  final a = s1.isEmpty ? <String>[] : s1.split(' ');
  final b = s2.isEmpty ? <String>[] : s2.split(' ');
  final maxLen = (a.length > b.length ? a.length : b.length);
  if (maxLen == 0) return 100.0;
  final dist = levenshteinList(a, b);
  final perc = (1 - dist / maxLen) * 100;
  return (perc < 0) ? 0.0 : perc;
}

class EditOp {
  final String op; // 'eq','sub','ins','del'
  final String? aToken;
  final String? bToken;
  EditOp(this.op, this.aToken, this.bToken);
}

List<EditOp> alignLists(List<String> a, List<String> b) {
  final m = a.length;
  final n = b.length;
  final dp = List.generate(m + 1, (_) => List<int>.filled(n + 1, 0));
  for (int i = 0; i <= m; i++) dp[i][0] = i;
  for (int j = 0; j <= n; j++) dp[0][j] = j;

  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      final same = a[i - 1] == b[j - 1];
      dp[i][j] = [
        dp[i - 1][j] + 1, // del
        dp[i][j - 1] + 1, // ins
        dp[i - 1][j - 1] + (same ? 0 : 1) // sub/equal
      ].reduce((x, y) => x < y ? x : y);
    }
  }

 
  int i = m, j = n;
  final ops = <EditOp>[];
  while (i > 0 || j > 0) {
    if (i > 0 && j > 0 && a[i - 1] == b[j - 1]) {
      ops.add(EditOp('eq', a[i - 1], b[j - 1]));
      i--;
      j--;
    } else if (i > 0 && j > 0 && dp[i][j] == dp[i - 1][j - 1] + 1) {
      ops.add(EditOp('sub', a[i - 1], b[j - 1]));
      i--;
      j--;
    } else if (i > 0 && dp[i][j] == dp[i - 1][j] + 1) {
      ops.add(EditOp('del', a[i - 1], null));
      i--;
    } else {
      ops.add(EditOp('ins', null, b[j - 1]));
      j--;
    }
  }

  return ops.reversed.toList();
}

double compareTranscriptWithReference(String transcript, String reference) {
  final tNorm = normalizeArabic(transcript);
  final rNorm = normalizeArabic(reference);

  if (tNorm.isEmpty && rNorm.isEmpty) return 100.0;

  final a = tNorm.split(' ');
  final b = rNorm.split(' ');

  final maxLen = a.length > b.length ? a.length : b.length;
  if (maxLen == 0) return 100.0;

  final dist = levenshteinList(a, b);
  final similarity = (1 - dist / maxLen) * 100;
  return similarity < 0 ? 0.0 : similarity;
}

Future<List<dynamic>> loadOriginalTexts() async {
  String jsonString = await rootBundle.loadString('assets/hadith.json');
  return jsonDecode(jsonString);
}

Future<String?> getOriginalTextById(String id) async {
  String jsonString = await rootBundle.loadString('assets/hadith.json');
  List<dynamic> texts = jsonDecode(jsonString);

  final match = texts.firstWhere(
    (item) => item['id'] == id,
    orElse: () => null,
  );

  return match != null ? match['text'] as String : null;
}

Future<double?> compareTranscriptWithJsonId(
    String transcript, String id) async {
  String? reference = await getOriginalTextById(id);
  if (reference == null) return null; 
  final tNorm = normalizeArabic(transcript);
  final rNorm = normalizeArabic(reference);

  final a = tNorm.split(' ');
  final b = rNorm.split(' ');

  final maxLen = a.length > b.length ? a.length : b.length;
  if (maxLen == 0) return 100.0;

  final dist = levenshteinList(a, b);
  final similarity = (1 - dist / maxLen) * 100;
  return similarity < 0 ? 0.0 : similarity;
}
