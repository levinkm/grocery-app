import '../../models/categories_model.dart';

abstract class CategoriesState {}

class InitCategoryState extends CategoriesState {}

class LoadingCategoryState extends CategoriesState {}

class SuccessCategoryState extends CategoriesState {
  final Categories categories;
  SuccessCategoryState(this.categories);
}

class ErrorCategoryState extends CategoriesState {
  final String message;
  ErrorCategoryState(this.message);
}


