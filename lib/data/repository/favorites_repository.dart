import 'package:injectable/injectable.dart';

import '../data_source/local_data_source.dart';
import '../model/favorite_fact/favorite_fact_model.dart';

abstract class LocalRepository {
  Future<List<FavoriteFactModel>> getFacts();

  Future<bool> saveFact({
    required String text,
    required String createdAt,
  });
}

@LazySingleton(as: LocalRepository)
class LocalFactRepository extends LocalRepository {
  final LocalDataSource _localDataSource;

  LocalFactRepository({
    @Named.from(LocalDataSourceImpl) required LocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<List<FavoriteFactModel>> getFacts() async {
    return _localDataSource.getFacts();
  }

  @override
  Future<bool> saveFact({
    required String text,
    required String createdAt,
  }) async {
    final fact = FavoriteFactModel(
      text: text,
      createdAt: createdAt,
    );
    return _localDataSource.addFact(fact);
  }
}
