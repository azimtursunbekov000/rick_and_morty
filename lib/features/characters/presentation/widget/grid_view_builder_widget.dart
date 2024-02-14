import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/logic/bloc/characters_bloc.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';

class GridViewBuilderContent extends StatelessWidget {
  final CharactersLoadedState state;

  const GridViewBuilderContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: state.charactersResult.results?.length ?? 0,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/characterDetail',
              arguments: state.charactersResult.results?[index],
            );
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 79.w,
                  height: 79.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(39.5.r),
                    image: DecorationImage(
                      image: NetworkImage(
                          state.charactersResult.results![index].image ?? ''),
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                Text(
                  statusConverter(
                    state.charactersResult.results?[index].status,
                  ),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: statusColorConverter(
                      state.charactersResult.results?[index].status,
                    ),
                  ),
                ),
                Text(
                  state.charactersResult.results?[index].name ?? "",
                  style: TextHelper.w600s16,
                ),
                Text(
                  "${speciesConverter(state.charactersResult.results?[index].species)}, ${genderConverter(state.charactersResult.results?[index].gender)}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: speciesColorConverter(
                        state.charactersResult.results?[index].species),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
