import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

abstract class TextHelper {
  static TextStyle w600s12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ThemeColor.colorText,
  );

  static TextStyle w600s14 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ThemeColor.colorText,
  );

  static TextStyle btnText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ThemeColor.colorBtnText,
  );

  static TextStyle w600s16 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ThemeColor.colorTextWh,
  );

  static TextStyle w600s34 = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.w600,
    color: ThemeColor.colorTextWh,
  );

  static TextStyle hintText = TextStyle(
    fontSize: 14.sp,
    color: ThemeColor.hintTextCl,
  );

  static TextStyle discriptionw400s12 = TextStyle(
    fontSize: 12.sp,
    color: ThemeColor.discription,
  );
}
