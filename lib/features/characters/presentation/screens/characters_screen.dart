import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/logic/bloc/characters_bloc.dart';
import 'package:rick_and_morty/internal/dependensies/get_it.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  CharactersBloc charactersBloc = getIt<CharactersBloc>();

  @override
  void initState() {
    charactersBloc.add(GetAllCharacters());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: TextFormField(),
          ),
      body: Center(
        child: BlocConsumer<CharactersBloc, CharactersState>(
          bloc: charactersBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is Characters) {
              return CircularProgressIndicator();
            }

            if (state is CharactersLoadedState) {
              return ListView.separated(
                itemCount: state.charactersModelList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/settings');
                    },
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        children: [
                          // Text(state
                          //     .charactersModelList[index].results![index].id
                          //     .toString()),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
