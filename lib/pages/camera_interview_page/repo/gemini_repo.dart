import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interview_app/pages/camera_interview_page/models/gemini_response_model.dart';

class GeminiRepository  {
  //it won't work untill we enter valid api here. i removed the api on purpose
  final String api = 'enter your api key';
  Uri url = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent',
  );
  final body = jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': 'hii, reply one word only'},
              ],
            },
          ],
        });

  Future getResponse() async {
    try {
      final response = await http.post(
        url,
        headers: {
          'x-goog-api-key': api,
          'contentType': 'application/json',
        },
        body: body,
      );
      final result = jsonDecode(response.body);
      GeminiResponseModel(candidates: result['candidates']);
    } catch (e) {
      print(e);
    }
  }
}
