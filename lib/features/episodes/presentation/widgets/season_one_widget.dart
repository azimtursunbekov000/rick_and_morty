import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/episodes/presentation/logic/bloc/episodes_bloc.dart';

class SeasonOne extends StatelessWidget {
  final EpisodesLoadedState state;
  const SeasonOne({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: state.episodesResult.results?.length ?? 0,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/episode_detail',
              arguments: state.episodesResult.results?[index],
            );
          },
          child: Container(
            color: Colors.red,
            height: 60.h,
            width: 361.w,
            child: Row(
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  color: Colors.amber,
                ),
                Text(state.episodesResult.results?[index].name ?? ''),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10.h);
      },
    );
  }
}
