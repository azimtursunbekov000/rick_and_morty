import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/logic/bloc/characters_bloc.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';

class ListViewSeparatedContent extends StatelessWidget {
  final CharactersLoadedState state;

  const ListViewSeparatedContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
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
          child: Row(
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
              SizedBox(width: 18.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Row(
                    children: [
                      Text(
                        speciesConverter(
                          state.charactersResult.results?[index].species,
                        ),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: speciesColorConverter(
                              state.charactersResult.results?[index].species),
                        ),
                      ),
                      Text(
                        ',${genderConverter(state.charactersResult.results?[index].gender)}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: genderColorConverter(
                            state.charactersResult.results?[index].gender,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10.h);
      },
    );
  }
}
