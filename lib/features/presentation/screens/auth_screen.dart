import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/text_helper.dart';
import 'package:rick_and_morty/internal/theme_helper.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: ThemeColor.backgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 376.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/Rick_and_Morty.png",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Логин",
                style: TextHelper.w600s14,
              ),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  prefixIcon: Icon(Icons.login),
                  hintText: 'Логин',
                  filled: true,
                  fillColor: Color(0xffF2F2F2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Пароль",
                style: TextHelper.w600s14,
              ),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  prefixIcon: Icon(Icons.password),
                  hintText: 'Пароль',
                  filled: true,
                  fillColor: Color(0xffF2F2F2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    Size(319.w, 50.h),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xff22A2BD),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Войти",
                  style: TextHelper.w600s16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "У вас еще нет аккаунта?",
                    style: TextHelper.w600s14,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(
                        Color(0xff43D049),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Создать"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
