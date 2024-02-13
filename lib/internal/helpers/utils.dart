import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/data/models/users_model.dart';

String statusConverter(Status? status) {
  switch (status) {
    case Status.ALIVE:
      return 'Живой';

    case Status.DEAD:
      return 'Мертвый';

    default:
      return 'Неизвестно';
  }
}

Color statusColorConverter(Status? status) {
  switch (status) {
    case Status.ALIVE:
      return const Color(0xff43D049);

    case Status.DEAD:
      return Colors.red;

    default:
      return Colors.black;
  }
}

String speciesConverter(Species? species) {
  switch (species) {
    case Species.HUMAN:
      return 'Человек';

    case Species.ALIEN:
      return 'Инопланетянин';

    default:
      return 'Неизвестно';
  }
}

Color speciesColorConverter(Species? species) {
  switch (species) {
    case Species.HUMAN:
      return const Color(0xff828282);

    case Species.ALIEN:
      return const Color(0xff828282);

    default:
      return Colors.black;
  }
}

String genderConverter(Gender? gender) {
  switch (gender) {
    case Gender.FEMALE:
      return 'Женский';

    case Gender.MALE:
      return 'Мужcкой';

    default:
      return 'Неизвестно';
  }
}

Color genderColorConverter(Gender? gender) {
  switch (gender) {
    case Gender.FEMALE:
      return const Color(0xff828282);

    case Gender.MALE:
      return const Color(0xff828282);

    default:
      return Colors.black;
  }
}
