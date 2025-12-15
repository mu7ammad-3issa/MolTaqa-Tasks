import 'package:seed/features/auth/domain/entities/login_response_entity.dart';

import 'data.dart';

class LoginResponseModel extends LoginResponseEntity {
  final Data? data;
  final int? status;

  LoginResponseModel({this.data, this.status})
    : super(
        token: data?.accessToken ?? '',
      );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'data': data?.toJson(), 'status': status};
}
