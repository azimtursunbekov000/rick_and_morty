import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String firstText;
  final String secondText;

  const DescriptionWidget({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            firstText,
            // Add your text style here if needed
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            secondText,
            // Add your text style here if needed
          ),
        ),
      ],
    );
  }
}
