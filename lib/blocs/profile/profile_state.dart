part of 'profile_cubit.dart';

enum ProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProfileState extends Equatable {
  final ProfileStatus status;
  final User user;
  final CustomError? error;

  const ProfileState({
    required this.status,
    required this.user,
    required this.error,
  });

  factory ProfileState.initial() {
    return ProfileState(
      status: ProfileStatus.initial,
      user: User.initialUser(),
      error: const CustomError(),
    );
  }

  ProfileState copyWith({
    ProfileStatus? status,
    User? user,
    CustomError? error,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, user, error];

  @override
  bool get stringify => true;
}
