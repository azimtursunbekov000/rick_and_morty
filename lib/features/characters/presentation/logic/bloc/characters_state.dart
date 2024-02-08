part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitialState extends CharactersState {}

class CharactersLoadingState extends CharactersState {}

class CharactersLoadedState extends CharactersState {
  final List<CharactersModel> charactersModelList;

  CharactersLoadedState({required this.charactersModelList});
}

class CharactersErrorState extends CharactersState {
  final CatchException error;

  CharactersErrorState({required this.error});
}
