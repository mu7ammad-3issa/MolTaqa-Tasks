import 'package:seed/features/auth/domain/entities/change_mobile_response_entity.dart';

import 'change_mobile_data.dart';

class ChangeMobileResponseModel extends ChangeMobileResponseEntity {
  final ChangeMobileData? data;
  final int? status;

  ChangeMobileResponseModel({this.data, this.status})
    : super(accessToken: data?.accessToken ?? '');

  factory ChangeMobileResponseModel.fromJson(Map<String, dynamic> json) {
    return ChangeMobileResponseModel(
      data: json['data'] == null
          ? null
          : ChangeMobileData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'data': data?.toJson(), 'status': status};
}
