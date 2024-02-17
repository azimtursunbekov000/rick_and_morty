part of 'episodes_bloc.dart';

@immutable
sealed class EpisodesState {}

final class EpisodesInitialState extends EpisodesState {}

final class EpisodesLoadingState extends EpisodesState {}

final class EpisodesLoadedState extends EpisodesState {
  final EpisodesResult episodesResult;

  EpisodesLoadedState({required this.episodesResult});
}

final class EpisodesErrorState extends EpisodesState {
  final CatchException error;

  EpisodesErrorState({required this.error});
}
