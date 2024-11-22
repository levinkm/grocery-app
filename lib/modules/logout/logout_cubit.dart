import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/logout_repository.dart';

part 'logout_state.dart';



// class LogoutCubit extends Cubit<LogoutState> {
//   final LogoutRepository _repository;
//
//   LogoutCubit(this._repository) : super(LogoutInitial());
//
//   Future<void> logout(String token) async {
//     emit(LogoutLoading());
//
//     try {
//       await _repository.logout(token);
//       emit(LogoutSuccess());
//     } on DioError catch (e) {
//       emit(LogoutFailure(e.message));
//     } catch (e) {
//       emit(LogoutFailure('An unknown error occurred'));
//     }
//   }
// }


class LogoutCubit extends Cubit<LogoutState> {
  final LogoutRepository _logoutRepository;

  LogoutCubit(this._logoutRepository) : super(LogoutInitial());

  Future<void> logout(String token) async {
    try {
      emit(LogoutLoading());
      await _logoutRepository.logout(token);
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}
