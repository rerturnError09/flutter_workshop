class GeminiResponseModel {
  final List<Candidate> candidates;

  GeminiResponseModel({required this.candidates});
}

class Candidate {
  final Content content;

  Candidate({required this.content});

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      Candidate(content: Content.fromJson(json["content"]));

  Map<String, dynamic> toJson() => {"content": content.toJson()};
}

class Content {
  final List parts;
  final String role;
  Content({required this.parts, required this.role});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    parts: List<Part>.from(json["parts"].map((x) => Part.fromJson(x))),
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "parts": List<dynamic>.from(parts.map((x) => x.toJson())),
    "role": role,
  };
}

class Part {
  String text;

  Part({required this.text});

  factory Part.fromJson(Map<String, dynamic> json) => Part(text: json["text"]);

  Map<String, dynamic> toJson() => {"text": text};
}
