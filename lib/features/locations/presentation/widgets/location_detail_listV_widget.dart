import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/locations/presentation/screens/location_detail_screen.dart';

class LocationDetailListvWidget extends StatelessWidget {
  const LocationDetailListvWidget({
    super.key,
    required this.widget,
  });

  final LocationDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: widget.locationModel.residents?.length ?? 0,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.red,
            height: 74.h,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10.h);
        },
      ),
    );
  }
}
