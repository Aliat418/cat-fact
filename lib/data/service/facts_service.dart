import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../infrastructure/constants.dart';

import '../../model/fact/fact.dart';

part 'facts_service.g.dart';

@injectable
@RestApi(baseUrl: kFactsBaseUrl)
abstract class FactService {
  @factoryMethod
  factory FactService(
    Dio dio,
  ) = _FactService;

  @GET(kFacts)
  Future<List<Fact>> getFacts();
}
