abstract class LocalDataSource {
  Future<void> saveData(String key, dynamic value);
  Future<dynamic> getData(String key);
  Future<void> deleteData(String key);
  Future<void> clearAll();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<void> saveData(String key, dynamic value) async {
    // Implementar com Hive ou SharedPreferences
  }

  @override
  Future<dynamic> getData(String key) async {
    // Implementar com Hive ou SharedPreferences
    return null;
  }

  @override
  Future<void> deleteData(String key) async {
    // Implementar com Hive ou SharedPreferences
  }

  @override
  Future<void> clearAll() async {
    // Implementar com Hive ou SharedPreferences
  }
}
