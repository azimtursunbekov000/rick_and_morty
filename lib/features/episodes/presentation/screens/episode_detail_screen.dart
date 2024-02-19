import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/episodes/data/models/episodes_model.dart';

class EpisodeDetailScreen extends StatelessWidget {
  final EpisodesModel episodesModel;
  const EpisodeDetailScreen({
    super.key,
    required this.episodesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(218.0.h),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(''),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 220.h,
                  child: Container(
                    height: 98.h,
                    width: 98.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff22A2BD),
                    ),
                  ),
                ),
                Positioned(
                  top: 227.h,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow),
                    color: Colors.white,
                    iconSize: 70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 40.h,
        ),
        child: Container(
          height: 420.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: [
                Text(''),
                Text(''),
                const Expanded(
                  flex: -1,
                  child: Text(""),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  flex: -2,
                  child: Container(
                    height: 156,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
