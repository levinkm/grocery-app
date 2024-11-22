import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/category_repository.dart';
import 'category_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository _repository;

  CategoriesCubit(this._repository) : super(InitCategoryState());

  Future<void> getCategories() async {
    try {
      emit(LoadingCategoryState());
      final categories = await _repository.getAll();
      emit(SuccessCategoryState(categories));
    } catch (e) {
      emit(ErrorCategoryState(e.toString()));
    }
  }
}
