// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/characters/data/repositories/user_repository_impl.dart'
    as _i7;
import '../../features/characters/domain/repositories/user_repository.dart'
    as _i6;
import '../../features/characters/domain/use_case/user_use_case.dart' as _i8;
import '../../features/characters/presentation/logic/bloc/characters_bloc.dart'
    as _i9;
import '../../features/locations/data/repositories/location_repository_impl.dart'
    as _i4;
import '../../features/locations/domain/repositories/location_repository.dart'
    as _i3;
import '../../features/locations/domain/use_case/location_use_case.dart' as _i5;
import '../../features/locations/presentation/logic/bloc/location_bloc.dart'
    as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.LocationRepository>(() => _i4.LocationRepositoryImpl());
  gh.factory<_i5.LocationUseCase>(() =>
      _i5.LocationUseCase(locationRepository: gh<_i3.LocationRepository>()));
  gh.factory<_i6.UserRepository>(() => _i7.UserRepositoriImpl());
  gh.factory<_i8.UserUseCase>(
      () => _i8.UserUseCase(userRepository: gh<_i6.UserRepository>()));
  gh.factory<_i9.CharactersBloc>(
      () => _i9.CharactersBloc(gh<_i8.UserUseCase>()));
  gh.factory<_i10.LocationBloc>(
      () => _i10.LocationBloc(gh<_i5.LocationUseCase>()));
  return getIt;
}
