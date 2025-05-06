import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../entity/sign_in_request.dart';
import '../entity/sign_in_response_entity.dart';
import '../repository/auth_repository.dart';

@injectable
class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<Result<SignUpResponseEntity>> execute(SignInRequest data) {
    return _authRepository.signIn(data);
  }
}
