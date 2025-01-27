import 'package:ecommerce/features/products/domain/use_cases/get_products.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductsCubit extends Cubit<ProductState> {
  int productQuantity =1 ;
  ProductsCubit(this._getProducts) : super(ProductInitial());
  final GetProducts _getProducts;

  Future<void> getProducts({String? categoryId}) async {
    emit(getProductsLoading());
    final result = await _getProducts(categoryId);
    result.fold((failure) => emit(getProductsError(failure.message)),
        (products) => emit(getProductsSuccess(products)),);
  }
  void onProductQuantityChange (int newQuantity){
    productQuantity = newQuantity;
    emit(productQuantityChange());
  }
}

