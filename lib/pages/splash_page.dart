import 'package:fb_auth_bloc/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';
import 'signin_page.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        debugPrint('listener: $state');

        if (state.authStatus == AuthStatus.unauthenticated) {
          Navigator.of(context).pushReplacementNamed(SigninPage.routeName);
        } else if (state.authStatus == AuthStatus.authenticated) {
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        }
      },
      builder: (context, state) {
        debugPrint('builder: $state');
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
