import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/custom_error.dart';
import '../../models/user_model.dart';
import '../../repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit({
    required this.profileRepository,
  }) : super(ProfileState.initial());

  Future<void> getUser({required String uid}) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      final user = await profileRepository.getUser(uid: uid);
      emit(state.copyWith(
        status: ProfileStatus.loaded,
        user: user,
      ));
    } on CustomError catch (e) {
      emit(state.copyWith(
        status: ProfileStatus.error,
        error: e,
      ));
    }
  }
}
