import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio dio () => Dio(
      BaseOptions(
          baseUrl: APIConstants.baseUrl,
          receiveDataWhenStatusError: true,
      ),);
  @preResolve // if you need to pre resolve the value
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}