// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/characters/data/models/users_model.dart';
import 'package:rick_and_morty/features/characters/domain/use_case/user_use_case.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

part 'characters_event.dart';
part 'characters_state.dart';
@injectable
class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final UserUseCase userUseCase;
  CharactersBloc(this.userUseCase) : super(CharactersInitialState()) {
    on<GetAllCharacters>((event, emit) async {
      try {
        emit(CharactersLoadingState());

        CharactersResult charactersModelList = await userUseCase.getAllCharacters();

        emit(CharactersLoadedState(charactersResult: charactersModelList));
      } catch (e) {
        print('ошибка $e');
        emit(
          CharactersErrorState(
            error: CatchException.convertException(e),
          ),
        );
      }
    });
  }
}
