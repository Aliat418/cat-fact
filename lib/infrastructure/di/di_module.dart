import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants.dart';

@module
abstract class DiModule {
  @Named('BaseUrl')
  String get baseUrl => kFactsBaseUrl;

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    return dio;
  }
}
