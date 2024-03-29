import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';
import 'package:rick_and_morty/features/locations/presentation/widgets/location_detail_listV_widget.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class LocationDetailScreen extends StatefulWidget {
  final LocationModel locationModel;
  const LocationDetailScreen({
    Key? key,
    required this.locationModel,
  }) : super(key: key);

  @override
  State<LocationDetailScreen> createState() => _LocationDetailScreenState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<LocationModel>('characterModel', locationModel));
  }
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: const Alignment(-1, -0.5),
            height: 298,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/location.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 240.h),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 24.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.locationModel.name ?? '',
                      style: TextHelper.locationName,
                    ),
                    Text(widget.locationModel.dimension ?? ''),
                    SizedBox(height: 32.h),
                    const Expanded(
                      flex: -1,
                      child: Text(
                        "Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.",
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      flex: -1,
                      child: Text(
                        "Персонажи",
                        style: TextHelper.w600s16,
                      ),
                    ),
                    LocationDetailListvWidget(
                      // widget: widget,
                      locationModel: widget.locationModel,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
