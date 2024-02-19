import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/widget/elevtd_button_widget.dart';
import 'package:rick_and_morty/features/settings/presentation/widgets/theme_is_widget.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil(
        '/login', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => signOut(),
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text('Настройки'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              child: Row(
                children: [
                  Container(
                    width: 80.w,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text('${user?.email}'),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: CustomElevatedButton(
                onPressed: () {},
                label: 'Редактировать',
              ),
            ),
            SizedBox(height: 36.h),
            Divider(),
            Text(
              "Внешний вид",
              style: TextHelper.discriptionw400s12,
            ),
            BlackThemeWidget(),
            TextButton(
              onPressed: () => signOut(),
              child: const Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}
