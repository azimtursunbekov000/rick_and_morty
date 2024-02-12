import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF2F2F2),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.filter),
        hintText: 'Найти персонажа',
        hintStyle: TextHelper.hintText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 15.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
