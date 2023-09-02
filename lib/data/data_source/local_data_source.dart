import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../model/favorite_fact/favorite_fact.dart';

abstract class LocalDataSource {
  Future<List<FavoriteFact>> getFacts();
  Future<bool> addFact(FavoriteFact fact);
}

@named
@Injectable(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final String _boxName = 'factsBox';

  @override
  Future<List<FavoriteFact>> getFacts() async {
    final box = await Hive.openBox<FavoriteFact>(_boxName);
    return box.values.toList();
  }

  @override
  Future<bool> addFact(FavoriteFact fact) async {
    final box = await Hive.openBox<FavoriteFact>(_boxName);
    try {
      await box.add(fact);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
