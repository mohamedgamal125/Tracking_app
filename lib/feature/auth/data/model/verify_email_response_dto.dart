import '../../domain/entity/verify_email_response_entity.dart';

class VerifyEmailResponseDto {
  final String? status;
  final String? message;
  final num? code;

  VerifyEmailResponseDto({this.status, this.message, this.code});

  factory VerifyEmailResponseDto.fromJson(Map<String, dynamic> json) {
    return VerifyEmailResponseDto(
      status: json['status'],
      message: json['message'],
      code: json['code'],
    );
  }

  VerifyEmailResponseEntity toEntity() {
    return VerifyEmailResponseEntity(
      status: status,
    );
  }
}
