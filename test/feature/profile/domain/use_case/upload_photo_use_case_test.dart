// import 'dart:io';
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:tracking_app/core/common/result.dart';
// import 'package:tracking_app/feature/profile/domain/repository/profile_screen_repository.dart';
// import 'package:tracking_app/feature/profile/domain/use_case/upload_photo_use_case.dart';
//
// import 'upload_photo_use_case_test.mocks.dart';
//
// @GenerateMocks([ProfileRepository])
// void main() {
//   late MockProfileRepository mockRepository;
//   late UploadPhotoUseCase useCase;
//
//   setUp(() {
//     mockRepository = MockProfileRepository();
//     useCase = UploadPhotoUseCase(mockRepository);
//   });
//
//   group('UploadPhotoUseCase', () {
//     final testFile = File('test/photo.png');
//
//     test('should return Success with URL string when uploadPhoto is successful', () async {
//       // Arrange
//       const uploadedUrl = 'https://example.com/photo.png';
//
//       when(mockRepository.uploadPhoto(testFile))
//           .thenAnswer((_) async => Success<String?>(uploadedUrl));
//
//       // Act
//       final result = await useCase.execute(testFile);
//
//       // Assert
//       expect(result, isA<Success<String?>>());
//       final success = result as Success<String?>;
//       expect(success.data, uploadedUrl);
//       verify(mockRepository.uploadPhoto(testFile)).called(1);
//     });
//
//     test('should return Error when uploadPhoto fails', () async {
//       // Arrange
//       const errorMessage = 'Upload failed';
//
//       when(mockRepository.uploadPhoto(testFile))
//           .thenAnswer((_) async => Error<String?>(errorMessage));
//
//       // Act
//       final result = await useCase.execute(testFile);
//
//       // Assert
//       expect(result, isA<Error<String?>>());
//       final error = result as Error<String?>;
//       expect(error.exception, errorMessage);
//       verify(mockRepository.uploadPhoto(testFile)).called(1);
//     });
//   });
// }
