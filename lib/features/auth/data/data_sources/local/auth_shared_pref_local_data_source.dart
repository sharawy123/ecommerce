import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  @override
  Future<String> getToken()async {
    final sharedPref=await SharedPreferences.getInstance();
    return sharedPref.getString(CachConstants.tokenKey)!;
  }
  @override
  Future<void> saveToken(String token) async{
    final sharedPref=await SharedPreferences.getInstance();
   await sharedPref.setString(CachConstants.tokenKey, token);
  }

}
