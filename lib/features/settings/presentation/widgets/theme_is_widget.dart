import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/settings/presentation/screens/theme_manager.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class BlackThemeWidget extends StatefulWidget {
  const BlackThemeWidget({Key? key}) : super(key: key);

  @override
  _BlackThemeWidgetState createState() => _BlackThemeWidgetState();
}

class _BlackThemeWidgetState extends State<BlackThemeWidget> {
  bool _isDarkThemeEnabled = false;

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
                _isDarkThemeEnabled ? "Включена" : "Выключена",
                style: TextHelper.discriptionw400s12,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Выберите режим темы'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('Включить темную тему'),
                          leading: Radio(
                            value: true,
                            groupValue: _isDarkThemeEnabled,
                            onChanged: (bool? value) {
                              setState(() {
                                _isDarkThemeEnabled = value!;
                                Provider.of<ThemeManager>(context,
                                        listen: false)
                                    .changeTheme(value!
                                        ? ThemeType.black
                                        : ThemeType.light);
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Выключить темную тему'),
                          leading: Radio(
                            value: false,
                            groupValue: _isDarkThemeEnabled,
                            onChanged: (bool? value) {
                              setState(() {
                                _isDarkThemeEnabled = value!;
                                Provider.of<ThemeManager>(context,
                                        listen: false)
                                    .changeTheme(value!
                                        ? ThemeType.black
                                        : ThemeType.light);
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
