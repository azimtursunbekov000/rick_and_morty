// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/characters/data/repositories/characters_repository_impl.dart'
    as _i10;
import '../../features/characters/domain/repositories/characters_repository.dart'
    as _i9;
import '../../features/characters/domain/use_case/characters_use_case.dart'
    as _i11;
import '../../features/characters/presentation/logic/bloc/characters_bloc.dart'
    as _i12;
import '../../features/episodes/data/repositories/episodes_repository_impl.dart'
    as _i4;
import '../../features/episodes/domain/repositories/episodes_repository.dart'
    as _i3;
import '../../features/episodes/domain/use_case/episodes_use_case.dart' as _i5;
import '../../features/episodes/presentation/logic/bloc/episodes_bloc.dart'
    as _i13;
import '../../features/locations/data/repositories/location_repository_impl.dart'
    as _i7;
import '../../features/locations/domain/repositories/location_repository.dart'
    as _i6;
import '../../features/locations/domain/use_case/location_use_case.dart' as _i8;
import '../../features/locations/presentation/logic/bloc/location_bloc.dart'
    as _i14;

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
  gh.factory<_i3.EpisodesRepository>(() => _i4.EpisodesRepositoryImpl());
  gh.factory<_i5.EpisodesUseCase>(() =>
      _i5.EpisodesUseCase(episodesRepository: gh<_i3.EpisodesRepository>()));
  gh.factory<_i6.LocationRepository>(() => _i7.LocationRepositoryImpl());
  gh.factory<_i8.LocationUseCase>(() =>
      _i8.LocationUseCase(locationRepository: gh<_i6.LocationRepository>()));
  gh.factory<_i9.UserRepository>(() => _i10.UserRepositoriImpl());
  gh.factory<_i11.UserUseCase>(
      () => _i11.UserUseCase(userRepository: gh<_i9.UserRepository>()));
  gh.factory<_i12.CharactersBloc>(
      () => _i12.CharactersBloc(gh<_i11.UserUseCase>()));
  gh.factory<_i13.EpisodesBloc>(
      () => _i13.EpisodesBloc(gh<_i5.EpisodesUseCase>()));
  gh.factory<_i14.LocationBloc>(
      () => _i14.LocationBloc(gh<_i8.LocationUseCase>()));
  return getIt;
}
