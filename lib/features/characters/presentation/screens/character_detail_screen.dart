import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/data/models/users_model.dart';
import 'package:rick_and_morty/features/characters/presentation/logic/bloc/characters_bloc.dart';
import 'package:rick_and_morty/internal/dependensies/get_it.dart';

class CharacterDetailScreen extends StatefulWidget {
  final CharacterModel charactersResult;

  const CharacterDetailScreen({
    super.key,
    required this.charactersResult,
  });

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  CharactersBloc charactersBloc = getIt<CharactersBloc>();

  @override
  void initState() {
    charactersBloc.add(GetAllCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.charactersResult.name ?? ''),
      ),
    );
  }
}
