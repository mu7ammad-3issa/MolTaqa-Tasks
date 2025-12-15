import 'user.dart';

class Data {
  final String? accessToken;
  final User? user;

  const Data({this.accessToken, this.user});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json['access_token'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'user': user?.toJson(),
  };
}
