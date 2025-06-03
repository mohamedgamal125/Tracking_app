// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:tracking_app/core/common/result.dart';
// import 'package:tracking_app/feature/profile/data/data_source/profile_local_data_source.dart';
// import 'package:tracking_app/feature/profile/domain/use_case/profile_screen_use_case.dart';
// import 'package:tracking_app/feature/profile/presentation/cubit/profile_state.dart';
// import 'package:tracking_app/feature/profile/presentation/cubit/profile_view_model.dart';
//
//
// import 'profile_view_model_test.mocks.dart';
// @GenerateMocks([ProfileUseCase, ProfileLocalDataSource])
//
// void main() {
//   late MockProfileUseCase mockProfileUseCase;
//   late MockProfileLocalDataSource mockLocalDataSource;
//   late ProfileViewModel viewModel;
//
//   setUp(() {
//     mockProfileUseCase = MockProfileUseCase();
//     mockLocalDataSource = MockProfileLocalDataSource();
//     viewModel = ProfileViewModel(mockProfileUseCase, mockLocalDataSource);
//   });
//
//   group('ProfileViewModel Tests', () {
//     final mockDriver = Driver(email: 'test@example.com'); // Replace with your Driver model
//     final mockProfile = Profile(driver: mockDriver); // Replace with your Profile model
//
//     blocTest<ProfileViewModel, ProfileState>(
//       'emits [LoadingProfileState, SuccessProfileState] when ProfileClickedIntent and use case returns Success',
//       build: () {
//         when(mockProfileUseCase.execute())
//             .thenAnswer((_) async => Success(data: mockProfile));
//         return viewModel;
//       },
//       act: (cubit) => cubit.doIntent(ProfileClickedIntent()),
//       expect: () => [
//         LoadingProfileState(),
//         SuccessProfileState(mockDriver),
//       ],
//     );
//
//     blocTest<ProfileViewModel, ProfileState>(
//       'emits [LoadingProfileState, ErrorProfileState] when ProfileClickedIntent and use case returns Success with null profile',
//       build: () {
//         when(mockProfileUseCase.execute())
//             .thenAnswer((_) async => Success(data: null));
//         return viewModel;
//       },
//       act: (cubit) => cubit.doIntent(ProfileClickedIntent()),
//       expect: () => [
//         LoadingProfileState(),
//         ErrorProfileState("No driver data found"),
//       ],
//     );
//
//     blocTest<ProfileViewModel, ProfileState>(
//       'emits [LoadingProfileState, ErrorProfileState] when ProfileClickedIntent and use case returns Error',
//       build: () {
//         when(mockProfileUseCase.execute())
//             .thenAnswer((_) async => Error('API failure'));
//         return viewModel;
//       },
//       act: (cubit) => cubit.doIntent(ProfileClickedIntent()),
//       expect: () => [
//         LoadingProfileState(),
//         ErrorProfileState("Profile API Error: Exception: API failure"),
//       ],
//     );
//
//     blocTest<ProfileViewModel, ProfileState>(
//       'emits [LoadingProfileState, LogoutSuccessState] when LogoutClickedIntent and logout succeeds',
//       build: () {
//         when(mockProfileUseCase.callLogout())
//             .thenAnswer((_) async => Success());
//         when(mockLocalDataSource.deleteToken())
//             .thenAnswer((_) async => Future.value());
//         return viewModel;
//       },
//       act: (cubit) => cubit.doIntent(LogoutClickedIntent()),
//       expect: () => [
//         LoadingProfileState(),
//         LogoutSuccessState(),
//       ],
//       verify: (_) {
//         verify(mockLocalDataSource.deleteToken()).called(1);
//       },
//     );
//
//     blocTest<ProfileViewModel, ProfileState>(
//       'emits [LoadingProfileState, ErrorProfileState] when LogoutClickedIntent and logout fails',
//       build: () {
//         when(mockProfileUseCase.callLogout())
//             .thenAnswer((_) async => Error('Logout failed'));
//         return viewModel;
//       },
//       act: (cubit) => cubit.doIntent(LogoutClickedIntent()),
//       expect: () => [
//         LoadingProfileState(),
//         ErrorProfileState("Logout failed: Exception: Logout failed"),
//       ],
//     );
//   });
// }
