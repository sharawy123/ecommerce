import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/domain/reposirtories/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/category.dart';

@lazySingleton
class GetCategories {
  final HomeRepository _homeRepository;
  GetCategories(this._homeRepository);

  Future<Either<Failure, List<Category>>> call()=>_homeRepository.getCategories();
}