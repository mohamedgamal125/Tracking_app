import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/change_password_entity.dart';

part 'change_password_dto.g.dart';

@JsonSerializable()
class ChangePasswordDTO extends ChangePasswordEntity {
  ChangePasswordDTO({super.message, super.error, super.token});

  factory ChangePasswordDTO.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordDTOFromJson(json);
}
