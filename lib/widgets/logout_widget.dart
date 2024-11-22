import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/logout/logout_cubit.dart';
import '../pages/login_page.dart';

class LogoutWidget extends StatelessWidget {
  final String token;

  const LogoutWidget({required this.token});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<LogoutCubit>().logout(token);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      icon: const Icon(Icons.logout),
    );
  }
}
