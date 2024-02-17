part of 'episodes_bloc.dart';

@immutable
sealed class EpisodesEvent {}

class GetAllEpisodes extends EpisodesEvent {}
