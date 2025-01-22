import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/mappers/category_mapper.dart';
import 'package:ecommerce/features/home/domain/reposirtories/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category.dart';
@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl  implements HomeRepository{
 final HomeRemoteDataSource _remoteDataSource;
  const HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
   try {
    final response = await _remoteDataSource.getCategories();
    final categories = response.categories.map((categoryModel) => categoryModel.toEntity).toList();
    return Right(categories);
   } on RemoteException catch(e){
    return Left(Failure(e.message));
   }
  }
}