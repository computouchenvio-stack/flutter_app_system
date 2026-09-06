import '../datasources/local_datasource.dart';

class AppRepository {
  final LocalDataSource localDataSource;

  AppRepository({required this.localDataSource});

  Future<void> saveUserData(String userId, Map<String, dynamic> data) async {
    await localDataSource.saveData('user_$userId', data);
  }

  Future<Map<String, dynamic>?> getUserData(String userId) async {
    return await localDataSource.getData('user_$userId');
  }
}
