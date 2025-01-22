 import 'package:ecommerce/features/home/domain/entities/category.dart';

abstract class HomeStates  {}


 class HomeInitial extends HomeStates {}
 class getCategoriesSucces extends HomeStates {
 List<Category> categories;
 getCategoriesSucces(this.categories);
 }
 class getCategoriesLoading extends HomeStates {}
 class getCategoriesError extends HomeStates {
  final String meassage;
  getCategoriesError(this.meassage);
 }