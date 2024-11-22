import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/sign_up_repository.dart';
//import '../models/user_model.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository _signUpRepository;

  SignUpCubit(this._signUpRepository) : super(SignUpInitial());

  void signUp(String name, String phone, String email, String password, String passwordConfirmation) async {
    try {
      emit(SignUpLoading());

      final user = await _signUpRepository.signUp(name, phone, email, password, passwordConfirmation);

      emit(SignUpSuccess(user));
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
