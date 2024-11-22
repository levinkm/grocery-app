import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/login_repository.dart';
import 'login_state.dart';

//import '../models/user_model.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(LoginInitial());

  void login(String email, String password) async {
    try {
      emit(LoginLoading());

      final user = await _loginRepository.login(email, password);

      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}