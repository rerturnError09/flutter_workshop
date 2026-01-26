import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:interview_app/pages/camera_interview_page/models/gemini_response_model.dart';


class GeminiRepository  {
  //it won't work untill we enter valid api here. i removed the api on purpose
  final String api = 'AIzaSyDPtq4RWOqFafr_pCGDLDQV6Qo9LrKSZcc';


final List<Map<String, dynamic>> _contents = [];




  Uri url = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent',
  );



  Future<String?> sendToGemini() async {
  final body = jsonEncode({
    "contents": _contents,
  });

  try {
    final response = await http.post(
      url,
      headers: {
        'x-goog-api-key': 'AIzaSyDPtq4RWOqFafr_pCGDLDQV6Qo9LrKSZcc',
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final post = Post.fromJson(result);

      final reply =
          post.candidates.first.content.parts.first.text;

      // Store Gemini reply in memory
      _contents.add({
        "role": "model",
        "parts": [
          {"text": reply}
        ]
      });
      log(reply);
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
- After each reply, summarize key points and then ask the next Flutter question.

Start the interview now by asking the first Flutter question.
"""
    }
  ]
});

}




}
