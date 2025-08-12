String normalizeArabic(String s) {
  s = s.toLowerCase();

  // حذف التشكيل والعلامات الصوتية
  s = s.replaceAll(RegExp(r'[\u064B-\u0652\u0670\u06D6-\u06ED]'), '');

  // توحيد بعض الحروف
  s = s.replaceAll(RegExp(r'[إأآ]'), 'ا');
  s = s.replaceAll('ى', 'ي');
  s = s.replaceAll('ؤ', 'و');
  s = s.replaceAll('ئ', 'ي');
  // (اختياري) توحيد التاء المربوطة إلى هاء أو العكس
  // s = s.replaceAll('ة', 'ه');

  // حذف علامات الترقيم والحروف غير العربية/أرقام
  s = s.replaceAll(RegExp(r'[^\u0600-\u06FF0-9\s]'), ' ');

  // ضغط الفراغات
  s = s.replaceAll(RegExp(r'\s+'), ' ').trim();

  return s;
}

// Levenshtein على مستوى الحروف (سلسلة نصية)
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
        dp[i - 1][j] + 1, // حذف
        dp[i][j - 1] + 1, // إضافة
        dp[i - 1][j - 1] + cost // استبدال/مطابقة
      ].reduce((a, b) => a < b ? a : b);
    }
  }
  return dp[m][n];
}

// Levenshtein على مستوى القوائم (كلمات) مع إرجاع مصفوفة الـ dp للاسترجاع
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

// نرجع التشابه كنسبة مئوية بناءً على الكلمات
double similarityPercentByWords(String s1, String s2) {
  final a = s1.isEmpty ? <String>[] : s1.split(' ');
  final b = s2.isEmpty ? <String>[] : s2.split(' ');
  final maxLen = (a.length > b.length ? a.length : b.length);
  if (maxLen == 0) return 100.0;
  final dist = levenshteinList(a, b);
  final perc = (1 - dist / maxLen) * 100;
  return (perc < 0) ? 0.0 : perc;
}

// --- نطبق محاذاة ونستخرج عمليات للتصحيح ---
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

  // backtrack
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

// دالة التصحيح: تحاول تستبدل كلمات التفريغ بكلمات المرجع إن كان الفرق صغيراً
String correctTranscriptByReference(String transcript, String reference,
    {double threshold = 0.4}) {
  final tNorm = normalizeArabic(transcript);
  final rNorm = normalizeArabic(reference);

  final tTokens = tNorm.isEmpty ? <String>[] : tNorm.split(' ');
  final rTokens = rNorm.isEmpty ? <String>[] : rNorm.split(' ');

  final ops = alignLists(tTokens, rTokens);
  final corrected = <String>[];
  for (final op in ops) {
    if (op.op == 'eq') {
      corrected.add(op.aToken!);
    } else if (op.op == 'sub') {
      final a = op.aToken ?? '';
      final b = op.bToken ?? '';
      final d = levenshtein(a, b);
      final maxLen = (a.length > b.length ? a.length : b.length);
      final rel = maxLen == 0 ? 0.0 : d / maxLen;
      if (rel <= threshold) {
        // نستخدم كلمة المرجع كتصحيح
        corrected.add(b);
      } else {
        // نحتفظ بالفظ الموجود في التفريغ
        corrected.add(a);
      }
    } else if (op.op == 'ins') {
      // إدراج كلمة المرجع (اختياري) — هنا ندرجها
      corrected.add(op.bToken!);
    } else if (op.op == 'del') {
      // حذف كلمة التفريغ (نتجاهل)
      // يمكنك اختيار إضافتها أو لا، هنا لا نضيف شيئًا.
    }
  }

  return corrected.join(' ');
}
