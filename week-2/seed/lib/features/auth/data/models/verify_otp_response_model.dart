import 'package:seed/features/auth/domain/entities/verify_otp_response_entity.dart';

class VerifyOtpResponseModel extends VerifyOtpResponseEntity {
  const VerifyOtpResponseModel({required super.status, required super.message});

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponseModel(
      status: json['status'] as int,
      message: json['message'] as String,
    );
  }
}
