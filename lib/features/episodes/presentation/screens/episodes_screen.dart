import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/widget/search_widget.dart';
import 'package:rick_and_morty/features/episodes/presentation/logic/bloc/episodes_bloc.dart';
import 'package:rick_and_morty/features/episodes/presentation/widgets/season_one_widget.dart';
import 'package:rick_and_morty/internal/dependensies/get_it.dart';

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  EpisodesBloc episodesBloc = getIt<EpisodesBloc>();

  @override
  void initState() {
    super.initState();
    episodesBloc.add(GetAllEpisodes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<EpisodesBloc, EpisodesState>(
          bloc: episodesBloc,
          listener: (context, state) {
            if (state is EpisodesErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error.message.toString(),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is EpisodesLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is EpisodesLoadedState) {
              return DefaultTabController(
                length: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 50.h),
                      const SearchWidget(hintText: 'Найти эпизод'),
                      const SizedBox(height: 30),
                      const TabBar(
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        tabs: [
                          Tab(text: 'Сезон 1'),
                          Tab(text: 'Сезон 2'),
                          Tab(text: 'Сезон 3'),
                          Tab(text: 'Сезон 4'),
                        ],
                        indicatorSize: TabBarIndicatorSize.tab,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SeasonOne(state: state),
                            Container(
                              width: 20,
                              color: Colors.red,
                            ),
                            Container(
                              width: 20,
                              color: Colors.amber,
                            ),
                            Container(
                              width: 20,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
