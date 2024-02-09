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
    as _i4;
import '../../features/characters/domain/presentation/user_repository.dart'
    as _i3;
import '../../features/characters/domain/use_case/user_use_case.dart' as _i5;
import '../../features/characters/presentation/logic/bloc/characters_bloc.dart'
    as _i6;

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
  gh.factory<_i3.UserRepository>(() => _i4.UserRepositoriImpl());
  gh.factory<_i5.UserUseCase>(
      () => _i5.UserUseCase(userRepository: gh<_i3.UserRepository>()));
  gh.factory<_i6.CharactersBloc>(
      () => _i6.CharactersBloc(gh<_i5.UserUseCase>()));
  return getIt;
}
