import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:interview_app/pages/camera_interview_page/models/gemini_response_model.dart';


class GeminiRepository  {
  //it won't work untill we enter valid api here. i removed the api on purpose
  final String api = 'enter your api key here';
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
    if(response.statusCode==200){
      final Map<String,dynamic> result = jsonDecode(response.body);
      log(result.toString());

      //converting to post model
      final post = Post.fromJson(result);

      if(post.candidates.isNotEmpty){
        final firstText = post.candidates.first.content.parts.first.text;
        log('first reply:$firstText');
      }
      log(post.runtimeType.toString());
      return post;
    }else{
      log('Error ${response.statusCode}: ${response.body}');
      return null;
    }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
