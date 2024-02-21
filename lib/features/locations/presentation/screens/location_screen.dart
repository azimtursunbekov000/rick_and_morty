import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/widget/search_widget.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';
import 'package:rick_and_morty/features/locations/presentation/logic/bloc/location_bloc.dart';
import 'package:rick_and_morty/features/locations/presentation/screens/location_images.dart';
import 'package:rick_and_morty/features/locations/presentation/widgets/list_view_sp_content_widget.dart';
import 'package:rick_and_morty/internal/dependensies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  late LocationBloc bloc;
  late ScrollController scrollController;
  bool isLoading = false;
  List<LocationModel> locationResultList = [];
  int counter = 1;
  int totalCount = 0;

  @override
  void initState() {
    bloc = getIt<LocationBloc>();
    bloc.add(
      GetAllLocations(
        isFirstCall: true,
        page: counter,
      ),
    );
    scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (locationResultList.isNotEmpty) {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        isLoading = true;

        if (isLoading) {
          counter = counter + 1;

          bloc.add(GetAllLocations(
            page: counter,
            isFirstCall: false,
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: BlocConsumer<LocationBloc, LocationState>(
          bloc: bloc,
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  const SearchWidget(hintText: 'Найти локацию'),
                  SizedBox(height: 10.h),
                  Text(
                    "Всего локаций: ${state.locationResult.info?.count.toString()}",
                    style: TextHelper.discriptionw400s12,
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    height: 560.h,
                    child: ListViewSPContent(
                      state: state,
                      imagesLocation: imagesLocation,
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
