
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_module/src/core/super_keys.dart';
import 'package:super_module/src/user/data/session/i_app_manager.dart';

@Injectable(as:IAppManager)
class AppManager implements IAppManager{
  SharedPreferences sharedPreferences;

  AppManager(this.sharedPreferences);

  @override
  Future<bool> isAppFirstTime() async{
    try{
      final result = sharedPreferences.getBool(SuperKeys.isAppFistTime);
      if(result!=null){
        return result;
      }
      return Future.value(true);
    }catch (e){
      return Future.value(false);
    }
  }

  @override
  Future<void> saveBool(String key, bool value) async{
    try{
      await sharedPreferences.setBool(SuperKeys.isAppFistTime, value);
    }catch(e){
      rethrow;
    }
  }

}