class User {
  final String userId;
  final String email;
  final String role;
  final String accessToken;

  User({
    required this.userId,
    required this.email,
    required this.role,
    required this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      email: json['email'],
      role: json['role'],
      accessToken: json['access_token'],
    );
  }
}
