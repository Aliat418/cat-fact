// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source/local_data_source.dart' as _i3;
import '../../data/repository/facts_repository.dart' as _i8;
import '../../data/repository/favorites_repository.dart' as _i4;
import '../../data/service/facts_service.dart' as _i6;
import '../../pages/fact_page/fact_page_cubit.dart' as _i9;
import '../../pages/favorites_page/favorites_page_cubit.dart' as _i7;
import 'di_module.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $configureDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final diModule = _$DiModule();
  gh.factory<_i3.LocalDataSource>(
    () => _i3.LocalDataSourceImpl(),
    instanceName: 'LocalDataSourceImpl',
  );
  gh.lazySingleton<_i4.LocalRepository>(() => _i4.LocalFactRepository(
      localDataSource:
          gh<_i3.LocalDataSource>(instanceName: 'LocalDataSourceImpl')));
  gh.factory<String>(
    () => diModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i5.Dio>(
      () => diModule.dio(gh<String>(instanceName: 'BaseUrl')));
  gh.factory<_i6.FactService>(() => _i6.FactService(gh<_i5.Dio>()));
  gh.factory<_i7.FavoritesPageCubit>(
      () => _i7.FavoritesPageCubit(gh<_i4.LocalRepository>()));
  gh.lazySingleton<_i8.RemoteFactsRepository>(
      () => _i8.RemoteFactsRepository(gh<_i6.FactService>()));
  gh.factory<_i9.FactPageCubit>(() => _i9.FactPageCubit(
        gh<_i8.RemoteFactsRepository>(),
        gh<_i4.LocalRepository>(),
      ));
  return getIt;
}

class _$DiModule extends _i10.DiModule {}
