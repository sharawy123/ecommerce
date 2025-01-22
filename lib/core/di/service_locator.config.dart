// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/core/di/register_module.dart' as _i709;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i395;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i258;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i407;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i385;
import 'package:ecommerce/features/auth/data/repositories/impl_auth_repository.dart'
    as _i902;
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart'
    as _i33;
import 'package:ecommerce/features/auth/domain/use_cases/login.dart' as _i658;
import 'package:ecommerce/features/auth/domain/use_cases/register.dart'
    as _i696;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i350;
import 'package:ecommerce/features/home/data/data_source/remote/home_api_remote_data_source.dart'
    as _i137;
import 'package:ecommerce/features/home/data/data_source/remote/home_remote_data_source.dart'
    as _i58;
import 'package:ecommerce/features/home/data/repositories/home_repository_impl.dart'
    as _i1028;
import 'package:ecommerce/features/home/domain/entities/category.dart' as _i67;
import 'package:ecommerce/features/home/domain/reposirtories/home_repository.dart'
    as _i796;
import 'package:ecommerce/features/home/domain/use_cases/get_gategories.dart'
    as _i2;
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart'
    as _i669;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i67.Category>(() => _i67.Category(
          id: gh<String>(),
          name: gh<String>(),
          image: gh<String>(),
        ));
    gh.lazySingleton<_i58.HomeRemoteDataSource>(
        () => _i137.HomeApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i385.AuthRemoteDataSource>(
        () => _i407.AuthApiRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i796.HomeRepository>(
        () => _i1028.HomeRepositoryImpl(gh<_i58.HomeRemoteDataSource>()));
    gh.singleton<_i395.AuthLocalDataSource>(() =>
        _i258.AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i2.GetGategories>(
        () => _i2.GetGategories(gh<_i796.HomeRepository>()));
    gh.singleton<_i33.AuthRepository>(() => _i902.ImplAuthRepository(
          gh<_i385.AuthRemoteDataSource>(),
          gh<_i395.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i669.HomeCubit>(
        () => _i669.HomeCubit(gh<_i2.GetGategories>()));
    gh.singleton<_i658.Login>(() => _i658.Login(gh<_i33.AuthRepository>()));
    gh.singleton<_i696.Register>(
        () => _i696.Register(gh<_i33.AuthRepository>()));
    gh.singleton<_i350.AuthCubit>(() => _i350.AuthCubit(
          gh<_i658.Login>(),
          gh<_i696.Register>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
