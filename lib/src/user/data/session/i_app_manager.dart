
abstract class IAppManager{
  Future<bool> isAppFirstTime();
  Future<void> saveBool(String key,bool value);
}