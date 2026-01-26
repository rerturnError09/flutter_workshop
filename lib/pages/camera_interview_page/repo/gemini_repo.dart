import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class GeminiRepository {
  final List<Map<String, dynamic>> _contents = [];

  Uri url = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent',
  );

  Future<String?> sendToGemini() async {
    final body = jsonEncode({"contents": _contents});

    try {
      final response = await http.post(
        url,
        headers: {
          //it won't work untill we enter valid api here. i removed the api on purpose
          'x-goog-api-key': 'Enter your key',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> result = jsonDecode(response.body);
        log(response.body);

        final candidates = result["candidates"];
        if (candidates == null || candidates.isEmpty) {
          log("No candidates in response: $result");
          return null;
        }

        final content = candidates.first["content"];
        final parts = content?["parts"];
        if (parts == null || parts.isEmpty) {
          log("No parts in candidate content: $content");
          return null;
        }

        final reply = parts.first["text"];
        if (reply == null || reply.isEmpty) {
          log("Reply is empty: $parts");
          return null;
        }

        // Store Gemini reply in memory
        _contents.add({
          "role": "model",
          "parts": [
            {"text": reply},
          ],
        });

        log("Next question from Gemini: $reply");
        return reply;
      } else {
        log('Error ${response.statusCode}: ${response.body}');
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  void addCandidateAnswer(String answer) {
    _contents.add({
      "role": "user",
      "parts": [
        {"text": answer},
      ],
    });
  }

  Future<String?> sendCandidateAnswer(String answer) async {
    // 1. Add candidate answer to memory
    addCandidateAnswer(answer);
    log('candidate answer:$answer');

    // 2. Send full memory to Gemini
    final nextQuestion = await sendToGemini();
    log('next question: $nextQuestion');

    // 3. Return Gemini response (summary + next question)
    return nextQuestion;
  }

  void startInterview() {
    _contents.clear();

    _contents.add({
      "role": "user",
      "parts": [
        {
          "text": """
You are a professional Flutter interviewer.

Rules:
- Ask ONE question at a time.
- Only ask Flutter-related questions.
- Do NOT give hints, answers, or explanations.
- Wait for the candidate’s reply.
- and your text will be directly been told to candidate so dont use word candidate instead adress him personal but respectful
- After each reply, summarize key points and then ask the next Flutter question.

Start the interview now by asking the first Flutter question.
""",
        },
      ],
    });
  }
}
