import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/locations/presentation/logic/bloc/location_bloc.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class ListViewSPContent extends StatelessWidget {
  final LocationLoadedState state;
  const ListViewSPContent({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: state.locationResult.results?.length ?? 0,
      itemBuilder: ((context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150.h,
              width: 343.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/location.png"),
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/location_detail');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                height: 68.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 2,
                      color: Colors.black26,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.locationResult.results?[index].name ?? '',
                      style: TextHelper.w600s16,
                    ),
                    SizedBox(height: 7.h),
                    Text(state.locationResult.results?[index].dimension ?? '')
                  ],
                ),
              ),
            ),
          ],
        );
      }),
      separatorBuilder: (context, index) {
        return SizedBox(height: 24.h);
      },
    );
  }
}
