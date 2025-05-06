import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/reset_password_response_entity.dart';

part 'reset_password_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDTO extends ResetPasswordResponseEntity {
  final String? error;

  ResetPasswordResponseDTO({
    super.message,
    super.token,
    this.error,
  });

  factory ResetPasswordResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseDTOToJson(this);
}

