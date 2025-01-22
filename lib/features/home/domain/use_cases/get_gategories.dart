import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/domain/reposirtories/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/category.dart';

@lazySingleton
class GetGategories {
  final HomeRepository _homeRepository;
  GetGategories(this._homeRepository);

  Future<Either<Failure, List<Category>>> call()=>_homeRepository.getCategories();
}