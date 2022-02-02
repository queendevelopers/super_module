abstract class IAppManager {
  Future<bool> isAppFirstTime();

  Future<void> saveBool({required String key, required bool value});
}
