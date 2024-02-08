import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/presentation/screens/verify_email_screen.dart';
import 'package:rick_and_morty/features/presentation/widget/email_input_widget.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );

      if (FirebaseAuth.instance.currentUser != null) {
        if (!FirebaseAuth.instance.currentUser!.emailVerified) {
          navigator.push(
              MaterialPageRoute(builder: (context) => VerifyEmailScreen()));
        } else {
          navigator.pushNamedAndRemoveUntil(
              '/bottom_nav_bar', (Route<dynamic> route) => false);
        }
      }
    } catch (error) {
      final catchException = CatchException.convertException(error);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(catchException.message ?? 'Произошла ошибка'),
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0.r),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
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
                  Text(
                    "Логин",
                    style: TextHelper.w600s14,
                  ),
                  SizedBox(height: 8.h),
                  EmailTextFromField(
                    emailTextInputController: emailTextInputController,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Пароль",
                    style: TextHelper.w600s14,
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    autocorrect: false,
                    controller: passwordTextInputController,
                    obscureText: isHiddenPassword,
                    validator: (value) => value != null && value.length < 6
                        ? 'Минимум 6 символов'
                        : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      hintText: 'Введите пароль',
                      prefixIcon: Icon(Icons.password),
                      suffix: InkWell(
                        onTap: togglePasswordView,
                        child: Icon(
                          isHiddenPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
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
                    onPressed: login,
                    child: Center(
                      child: Text(
                        'Войти',
                        style: TextHelper.btnText,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "У вас еще нет аккаунта?",
                        style: TextStyle(
                          color: Color(0xff5B6975),
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/signup'),
                        child: const Text(
                          'Создать',
                          style: TextStyle(
                            color: Color(0xff43D049),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   backgroundColor: ThemeColor.backgroundColor,
    //   appBar: AppBar(
    //     backgroundColor: ThemeColor.backgroundColor,
    //   ),
    //   body: Center(
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 30),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Container(
    //             height: 376,
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: AssetImage(
    //                   "assets/images/Rick_and_Morty.png",
    //                 ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           CustomTextFormField(
    //             label: 'Логин',
    //             controller: emailTextInputController,
    //             hintText: 'Логин',
    //             prefixIcon: Icons.login,
    //             obscureText: isHiddenPassword,
    //             validator: (String? value) {
    //               if (value == null ||
    //                   value.isEmpty ||
    //                   !EmailValidator.validate(value)) {
    //                 return 'Пожалуйста, введите действительный адрес электронной почты';
    //               }
    //               return null;
    //             },
    //           ),
    //           SizedBox(height: 10),
    //           CustomTextFormField(
    //             label: "Пароль",
    //             controller: passwordTextInputController,
    //             hintText: 'Пароль',
    //             prefixIcon: Icons.lock,
    //             suffixIcon:
    //                 isHiddenPassword ? Icons.visibility_off : Icons.visibility,
    //             obscureText: isHiddenPassword,
    //             togglePasswordView: togglePasswordView,
    //             validator: (String? value) {
    //               if (value != null && value.length <= 6) {}
    //               return null;
    //             },
    //           ),
    //           SizedBox(height: 20),
    //           CustomElevatedButton(
    //             onPressed: login,
    //             label: "Войти",
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 "У вас еще нет аккаунта?",
    //                 style: TextHelper.w600s14,
    //               ),
    //               TextButton(
    //                 style: ButtonStyle(
    //                   foregroundColor: MaterialStatePropertyAll(
    //                     Color(0xff43D049),
    //                   ),
    //                 ),
    //                 onPressed: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => RegistrationScreen(),
    //                     ),
    //                   );
    //                 },
    //                 child: Text("Создать"),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
