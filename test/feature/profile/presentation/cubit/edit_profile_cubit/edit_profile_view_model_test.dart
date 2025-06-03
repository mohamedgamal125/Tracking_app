import 'package:mockito/annotations.dart';
import 'package:tracking_app/feature/profile/domain/entity/profile_response_entity.dart';
import 'package:tracking_app/feature/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/profile/presentation/cubit/edit_profile_cubit/edit_profile_state.dart';
import 'package:tracking_app/feature/profile/presentation/cubit/edit_profile_cubit/edit_profile_view_model.dart';

import 'edit_profile_view_model_test.mocks.dart';

@GenerateMocks([EditProfileUseCase])
void main() {
  late MockEditProfileUseCase mockUseCase;
  late EditProfileViewModel viewModel;

  setUp(() {
    mockUseCase = MockEditProfileUseCase();
    viewModel = EditProfileViewModel(mockUseCase);
  });

  final tData = {
    'firstName': 'John',
    'lastName': 'Doe',
  };

  final tDriverEntity = DriverEntity(
    id: '1',
    firstName: 'John',
    lastName: 'Doe',
    phone: '123456789',
    email: 'john@example.com',
    vehicleType: 'Car',
    vehicleNumber: 'XYZ123',
    country: 'Country',
    vehicleLicense: '',
    gender: 'Male',
  );

  final tProfileResponseEntity = ProfileResponseEntity(
    message: 'Success',
    driver: tDriverEntity,
  );

  blocTest<EditProfileViewModel, EditProfileState>(
    'emits [Loading, Success] when editProfile succeeds',
    build: () {
      when(mockUseCase.execute(any)).thenAnswer((_) async => Success(tProfileResponseEntity));
      return viewModel;
    },
    act: (bloc) => bloc.editProfile(tData),
    expect: () => [
      EditProfileLoadingState(),
      EditProfileSuccessState(data: tProfileResponseEntity),
    ],
    verify: (_) {
      verify(mockUseCase.execute(tData)).called(1);
    },
  );

  blocTest<EditProfileViewModel, EditProfileState>(
    'emits [Loading, Error] when editProfile fails',
    build: () {
      when(mockUseCase.execute(any)).thenAnswer((_) async => Error('Edit Failed'));
      return viewModel;
    },
    act: (bloc) => bloc.editProfile(tData),
    expect: () => [
      EditProfileLoadingState(),
      EditProfileErrorState('Edit Failed'),
    ],
  );
}
