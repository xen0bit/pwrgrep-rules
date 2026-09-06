// AI usage detection: Gemini via google_generative_ai
// ruleid: detect-gemini
import 'package:google_generative_ai';
// ruleid: detect-gemini
final model = GenerativeModel('gemini-pro', 'key');
// ruleid: detect-gemini
final other = GenerativeModel('gemini-flash', 'key');
// ok: detect-gemini
import 'dart:io';
// ok: detect-gemini
final text = 'plain string';
// ok: detect-gemini
print('hello');
