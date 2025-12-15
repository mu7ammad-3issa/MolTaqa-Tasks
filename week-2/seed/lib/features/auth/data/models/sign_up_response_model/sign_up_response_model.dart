import 'package:seed/features/auth/domain/entities/sign_up_response_entity.dart';

import 'sign_up_data.dart';

class SignUpResponseModel extends SignUpResponseEntity {
  final SignUpData? data;
  final int? status;

  SignUpResponseModel({this.data, this.status})
    : super(
        accessToken: data?.accessToken ?? '',
      );

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      data: json['data'] == null
          ? null
          : SignUpData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'data': data?.toJson(), 'status': status};
}

