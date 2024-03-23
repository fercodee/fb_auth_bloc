import 'dart:async';

import 'package:fb_auth_bloc/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription authSubscription;
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthState.unknown()) {
    authSubscription = authRepository.user.listen((fb_auth.User? user) {
      add(AuthStateChangedEvent(user: user));
    });

    on<AuthStateChangedEvent>(
      (event, emit) {
        if (event.user != null) {
          emit(state.copyWith(
            authStatus: AuthStatus.authenticated,
            user: event.user,
          ));
        } else {
          emit(state.copyWith(
            authStatus: AuthStatus.unauthenticated,
            user: null,
          ));
        }
      },
    );

    on<SignOutRequestedEvent>(
      (event, emit) async {
        await authRepository.signout();
      },
    );
  }
}
