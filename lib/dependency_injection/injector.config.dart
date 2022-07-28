// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../src/data/datasources/local/product_db.dart' as _i3;
import '../src/domain/bloc/home_bloc.dart' as _i6;
import '../src/domain/repositories/products_repository.dart' as _i4;
import '../src/domain/usecases/products_usecase.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ProductDb>(() => _i3.ProductDbAdapter());
  gh.factory<_i4.ProductsRepository>(
      () => _i4.ProductsUseCaseAdapter(get<_i3.ProductDb>()));
  gh.factory<_i5.ProductsUseCase>(
      () => _i5.ProductsUseCaseAdapter(get<_i4.ProductsRepository>()));
  gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc(get<_i5.ProductsUseCase>()));
  return get;
}
