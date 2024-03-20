import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';
import 'package:rick_and_morty/features/locations/presentation/logic/bloc/location_bloc.dart';
import 'package:rick_and_morty/internal/dependensies/get_it.dart';
import 'package:shimmer/shimmer.dart';

class LocationDetailListvWidget extends StatefulWidget {
  final LocationModel locationModel;
  const LocationDetailListvWidget({
    super.key,
    // required this.widget,
    required this.locationModel,
  });

  // final LocationDetailScreen widget;

  @override
  State<LocationDetailListvWidget> createState() =>
      _LocationDetailListvWidgetState();
}

class _LocationDetailListvWidgetState extends State<LocationDetailListvWidget> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    locationBloc = getIt<LocationBloc>();
    locationBloc
        .add(GetResidentEvent(locationResultModel: widget.locationModel));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      bloc: locationBloc,
      builder: (context, state) {
        if (state is LocationLoadingState) {
          return LocationResidentsShimmer();
        }

        if (state is ResidentLoadedState) {
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: state.residentsModel.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.red,
                  height: 74.h,
                  width: 100,
                  child: Row(
                    children: [
                      Text(state.residentsModel[index].name!),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.h);
              },
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}

class LocationResidentsShimmer extends StatelessWidget {
  const LocationResidentsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CommonShimmer(
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.red,
              height: 74.h,
              width: 100,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
        ),
      ),
    );
  }
}

class CommonShimmer extends StatelessWidget {
  final Widget child;

  const CommonShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: child,
    );
  }
}
