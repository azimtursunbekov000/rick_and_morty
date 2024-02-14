import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/widget/search_widget.dart';
import 'package:rick_and_morty/features/locations/presentation/logic/bloc/location_bloc.dart';

import 'package:rick_and_morty/internal/dependensies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  LocationBloc locationBloc = getIt<LocationBloc>();

  @override
  void initState() {
    locationBloc.add(GetAllLocations());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24.h,
          horizontal: 15.w,
        ),
        child: Center(
          child: BlocConsumer<LocationBloc, LocationState>(
            bloc: locationBloc,
            listener: (context, state) {
              if (state is LocationErrorState) {
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
              if (state is LocationsScreen) {
                return const CircularProgressIndicator();
              }

              if (state is LocationLoadedState) {
                return ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchWidget(),
                        SizedBox(height: 10.h),
                        Text(
                          "Всего локаций: ${state.locationResult.info?.count.toString()}",
                          style: TextHelper.discriptionw400s12,
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(
                      height: 590.h,
                      child: ListView.separated(
                        itemCount: state.locationResult.results?.length ?? 0,
                        itemBuilder: ((context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 150.h,
                                width: 343.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/location.png"),
                                  ),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                              ),
                              Container(
                                height: 68.h,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(15),
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 24.h);
                        },
                      ),
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
