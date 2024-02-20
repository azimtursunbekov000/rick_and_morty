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
        automaticallyImplyLeading: false,
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
                  CircleAvatar(
                    radius: 50.r,
                    child: Image.network(
                      "https://img.freepik.com/premium-vector/user-profile-icon-flat-style-member-avatar-vector-illustration-isolated-background-human-permission-sign-business-concept_157943-15752.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text('${user?.email}'),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/detail_user');
                },
                label: 'Редактировать',
              ),
            ),
            SizedBox(height: 36.h),
            Divider(),
            Text(
              "Внешний вид",
              style: TextHelper.discriptionw400s12,
            ),
            const BlackThemeWidget(),
            SizedBox(height: 30.h),
            Expanded(
              flex: -1,
              child: Text(
                "О приложении",
                style: TextHelper.discriptionw400s12,
              ),
            ),
            SizedBox(height: 10.h),
            const Expanded(
              flex: -1,
              child: Text(
                  "Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концентрированной темной материи."),
            ),
            SizedBox(height: 30.h),
            Expanded(
              flex: -1,
              child: Divider(),
            ),
            Expanded(
              flex: -1,
              child: Text(
                "Версия приложения",
                style: TextHelper.discriptionw400s12,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              flex: -1,
              child: Text(
                "Rick & Morty  v1.0.0",
                style: TextHelper.w600s14,
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () => signOut(),
                child: const Text('Выйти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
