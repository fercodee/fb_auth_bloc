part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStateChangedEvent extends AuthEvent {
  final fb_auth.User? user;

  const AuthStateChangedEvent({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}

class SignOutRequestedEvent extends AuthEvent {}
