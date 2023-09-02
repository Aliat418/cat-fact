import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../model/favorite_fact/favorite_fact_model.dart';

abstract class LocalDataSource {
  Future<List<FavoriteFactModel>> getFacts();
  Future<bool> addFact(FavoriteFactModel fact);
}

@named
@Injectable(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final String _boxName = 'factsBox';

  @override
  Future<List<FavoriteFactModel>> getFacts() async {
    final box = await Hive.openBox<FavoriteFactModel>(_boxName);
    return box.values.toList();
  }

  @override
  Future<bool> addFact(FavoriteFactModel fact) async {
    final box = await Hive.openBox<FavoriteFactModel>(_boxName);
    try {
      await box.add(fact);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
