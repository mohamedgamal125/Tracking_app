import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/sign_in_response_entity.dart';

part 'sign_in_response_dto.g.dart';

@JsonSerializable()
class SignInResponseDTO extends SignUpResponseEntity {

  SignInResponseDTO({super.message, super.token});

  factory SignInResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseDTOToJson(this);
}


