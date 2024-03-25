part of 'signin_cubit.dart';

enum SigninStatus {
  initial,
  submitting,
  success,
  error,
}

class SigninState extends Equatable {
  final SigninStatus signinStatus;
  final CustomError error;

  factory SigninState.initial() {
    return const SigninState(
      signinStatus: SigninStatus.initial,
      error: CustomError(),
    );
  }

  const SigninState({
    required this.signinStatus,
    required this.error,
  });

  @override
  List<Object> get props => [signinStatus, error];

  @override
  String toString() =>
      'SigninState(signinStatus: $signinStatus, error: $error)';

  SigninState copyWith({
    SigninStatus? signinStatus,
    CustomError? error,
  }) {
    return SigninState(
      signinStatus: signinStatus ?? this.signinStatus,
      error: error ?? this.error,
    );
  }
}
