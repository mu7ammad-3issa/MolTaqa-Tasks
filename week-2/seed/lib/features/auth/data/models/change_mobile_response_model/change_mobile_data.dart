import 'change_mobile_user.dart';

class ChangeMobileData {
  final String? accessToken;
  final ChangeMobileUser? user;

  const ChangeMobileData({this.accessToken, this.user});

  factory ChangeMobileData.fromJson(Map<String, dynamic> json) =>
      ChangeMobileData(
        accessToken: json['access_token'] as String?,
        user: json['user'] == null
            ? null
            : ChangeMobileUser.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'user': user?.toJson(),
  };
}
