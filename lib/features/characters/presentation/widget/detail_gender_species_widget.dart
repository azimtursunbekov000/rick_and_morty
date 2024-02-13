import 'package:flutter/material.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';

class GenderAndSpeciesWidget extends StatelessWidget {
  final String firstText;
  final String secondText;

  const GenderAndSpeciesWidget({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            firstText,
            style: TextHelper.hintText,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            secondText,
            style: TextHelper.hintText,
          ),
        ),
      ],
    );
  }
}
