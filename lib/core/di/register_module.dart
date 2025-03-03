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
      ),)..interceptors.add(InterceptorsWrapper(
    onRequest: (options,handler) async{
      final sharedPref = await SharedPreferences.getInstance();
     final token = sharedPref.getString(CachConstants.tokenKey);
      if(token !=null) {
        options.headers[APIConstants.tokenKey]=token;
      }
      return handler.next(options);
    },
  ),);
  @preResolve // if you need to pre resolve the value
  Future <SharedPreferences> get prefs => SharedPreferences.getInstance();
}
