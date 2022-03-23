import 'dart:convert';

class Model {
  String username;
  String noise;
  String csrfToken;
  String accessToken;
  String refreshToken;
  int visits;
  Model({
    required this.username,
    required this.noise,
    required this.csrfToken,
    required this.accessToken,
    required this.refreshToken,
    required this.visits,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'noise': noise,
      'csrfToken': csrfToken,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'visits': visits,
    };
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      username: map['username'] ?? '',
      noise: map['noise'] ?? '',
      csrfToken: map['csrfToken'] ?? '',
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      visits: map['visits'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) => Model.fromMap(json.decode(source));
}
