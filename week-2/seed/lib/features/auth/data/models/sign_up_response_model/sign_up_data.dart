import 'sign_up_user.dart';

class SignUpData {
  final String? accessToken;
  final SignUpUser? user;

  const SignUpData({this.accessToken, this.user});

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
    accessToken: json['access_token'] as String?,
    user: json['user'] == null
        ? null
        : SignUpUser.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'user': user?.toJson(),
  };
}
