import 'package:ecommerce/features/home/domain/use_cases/get_gategories.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this._getGategories) : super(HomeInitial()){getCategories();}
  final GetGategories _getGategories;

  Future<void> getCategories() async {
    emit(getCategoriesLoading());
    final result = await _getGategories();
    result.fold((failure) => emit(getCategoriesError(failure.message)),
        (categories) => emit(getCategoriesSucces(categories),),);
  }
}
