import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/logic/bloc/characters_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/widget/grid_view_builder_widget.dart';
import 'package:rick_and_morty/features/characters/presentation/widget/list_view_sp_widget.dart';
import 'package:rick_and_morty/features/characters/presentation/widget/search_widget.dart';
import 'package:rick_and_morty/internal/dependensies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  CharactersBloc charactersBloc = getIt<CharactersBloc>();

  @override
  void initState() {
    charactersBloc.add(GetAllCharactersEvent());
    super.initState();
  }

  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24.h,
          horizontal: 15.w,
        ),
        child: Center(
          child: BlocConsumer<CharactersBloc, CharactersState>(
            bloc: charactersBloc,
            listener: (context, state) {
              if (state is CharactersErrorState) {
                final catchException =
                    CatchException.convertException(state.error);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text(catchException.message ?? "Что-то пошло не так"),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is Characters) {
                return const CircularProgressIndicator();
              }

              if (state is CharactersLoadedState) {
                return ListView(
                  children: [
                    Column(
                      children: [
                        SearchWidget(hintText: 'Найти персонажа'),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Всего персонажей: ${state.charactersResult.info?.count.toString()}",
                              style: TextHelper.discriptionw400s12,
                            ),
                            IconButton(
                              icon: Icon(
                                !isGridView ? Icons.grid_view : Icons.list,
                              ),
                              onPressed: () {
                                setState(() {
                                  isGridView = !isGridView;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(
                      height: 590.h,
                      child: isGridView
                          ? GridViewBuilderContent(state: state)
                          : ListViewSeparatedContent(state: state),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
