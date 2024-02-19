import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class BlackThemeWidget extends StatelessWidget {
  const BlackThemeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      child: Row(
        children: [
          Container(
            width: 37.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/black_theme.png"),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Темная тема"),
              Text(
                "Включена",
                style: TextHelper.discriptionw400s12,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
