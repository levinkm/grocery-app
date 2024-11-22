import '../../models/user_model.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final User user;

  SignUpSuccess(this.user);
}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure(this.error);
}