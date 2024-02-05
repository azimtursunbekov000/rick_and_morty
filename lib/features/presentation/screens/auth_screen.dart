import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

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
                controller: emailInputController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
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
                controller: passwordInputController,
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
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    Size(
                      319.w,
                      50.h,
                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
