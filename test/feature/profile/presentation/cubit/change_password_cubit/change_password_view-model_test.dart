// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:tracking_app/core/common/result.dart';
// import 'package:tracking_app/feature/profile/domain/use_case/change_password_use_case.dart';
// import 'package:tracking_app/feature/profile/data/model/change_password_request_model.dart';
// import 'package:tracking_app/feature/profile/domain/entity/change_password_entity.dart';
// import 'package:tracking_app/feature/profile/presentation/cubit/change_password_cubit/change_password_state.dart';
// import 'package:tracking_app/feature/profile/presentation/cubit/change_password_cubit/change_password_view-model.dart';
//
// class MockChangePasswordUseCase extends Mock implements ChangePasswordUseCase {}
//
// void main() {
//   late ChangePasswordViewModel viewModel;
//   late MockChangePasswordUseCase mockUseCase;
//
//   setUp(() {
//     mockUseCase = MockChangePasswordUseCase();
//     viewModel = ChangePasswordViewModel(mockUseCase);
//   });
//
//   group('ChangePasswordViewModel Tests', () {
//     final request = ChangePasswordRequestModel(
//       oldPassword: 'old123',
//       newPassword: 'new456',
//     );
//
//     test('Initial state is ChangePasswordLoadingState', () {
//       expect(viewModel.state, isA<ChangePasswordLoadingState>());
//     });
//
//     blocTest<ChangePasswordViewModel, ChangePasswordState>(
//       'emits [Loading, Success] when password is changed successfully',
//       build: () {
//         when(mockUseCase.execute(any)).thenAnswer(
//               (_) async => Success(ChangePasswordEntity(message: "success")),
//         );
//         viewModel.currentPasswordController.text = request.oldPassword;
//         viewModel.newPasswordController.text = request.newPassword;
//         return viewModel;
//       },
//       act: (bloc) => bloc.doIntent(ClickedChangePasswordIntent()),
//       expect: () => [
//         isA<ChangePasswordLoadingState>(),
//         isA<ChangePasswordSuccessState>(),
//       ],
//       verify: (_) {
//         verify(mockUseCase.execute(any)).called(1);
//       },
//     );
//
//     blocTest<ChangePasswordViewModel, ChangePasswordState>(
//       'emits [Loading, Error] when ChangePasswordEntity has an error message',
//       build: () {
//         when(mockUseCase.execute(any)).thenAnswer(
//               (_) async => Success(ChangePasswordEntity(message: "error", error: "Some error")),
//         );
//         viewModel.currentPasswordController.text = request.oldPassword;
//         viewModel.newPasswordController.text = request.newPassword;
//         return viewModel;
//       },
//       act: (bloc) => bloc.doIntent(ClickedChangePasswordIntent()),
//       expect: () => [
//         isA<ChangePasswordLoadingState>(),
//         isA<ChangePasswordErrorState>(),
//       ],
//     );
//
//     blocTest<ChangePasswordViewModel, ChangePasswordState>(
//       'emits [Loading, Error] on exception',
//       build: () {
//
//         when(mockUseCase.execute(any)).thenAnswer(
//               (_) async => Error("Network error"),
//         );
//         viewModel.currentPasswordController.text = request.oldPassword;
//         viewModel.newPasswordController.text = request.newPassword;
//         return viewModel;
//       },
//       act: (bloc) => bloc.doIntent(ClickedChangePasswordIntent()),
//       expect: () => [
//         isA<ChangePasswordLoadingState>(),
//         isA<ChangePasswordErrorState>(),
//       ],
//     );
//   });
// }
