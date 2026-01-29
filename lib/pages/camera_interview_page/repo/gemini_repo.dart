import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:interview_app/pages/camera_interview_page/models/gemini_response_model.dart';

class GeminiRepository {
  //it won't work untill we enter valid api here. i removed the api on purpose
  final String api = 'enter api key';
  Uri url = Uri.parse(
    "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent",
  );
  final body = jsonEncode({
    'contents': [
      {
        'parts': [
          {'text': 'tell about flutter'},
        ],
      },
    ],
  });

  Future getResponse() async {
    try {
      final response = await http.post(
        url,
        headers: {'x-goog-api-key': api, 'contentType': 'application/json'},
        body: body,
      );
      final result = jsonDecode(response.body);
      log(result.toString());
      GeminiResponseModel(candidates: result['candidates']);
    } catch (e) {
      print(e);
    }
  }
}
