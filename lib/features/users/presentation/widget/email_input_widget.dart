import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class EmailTextFromField extends StatelessWidget {
  const EmailTextFromField({
    super.key,
    required this.emailTextInputController,
  });

  final TextEditingController emailTextInputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      controller: emailTextInputController,
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? 'Введите правильный Email'
          : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF2F2F2),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 15.h,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.r),
        ),
        hintText: 'Введите Email',
        hintStyle: TextHelper.hintText,
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
