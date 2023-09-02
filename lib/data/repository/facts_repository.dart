import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../utils/ext/date_time_ext.dart';
import '../../model/fact/fact.dart';
import '../service/facts_service.dart';

@lazySingleton
class RemoteFactsRepository {
  final FactService _factService;

  RemoteFactsRepository(this._factService);

  Future<List<Fact>> getFacts() async {
    final facts = await _factService.getFacts()
      // Randomize the order
      ..shuffle();
    return facts;
  }

  Future<String> fetchFactDate(Fact fact) async {
    final String locale = Platform.localeName;
    return DateTimeExtension.formatDateYmd(fact.createdAt, locale);
  }
}
