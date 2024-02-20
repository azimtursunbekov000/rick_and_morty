import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/presentation/widget/detail_description_widget.dart';
import 'package:rick_and_morty/features/characters/presentation/widget/detail_gender_species_widget.dart';
import 'package:rick_and_morty/internal/helpers/text_helper.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';

class CharacterDetailScreen extends StatefulWidget {
  final CharacterModel charactersModel;

  const CharacterDetailScreen({
    Key? key,
    required this.charactersModel,
  }) : super(key: key);

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(218.0.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.charactersModel.image ?? ''),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 190.h,
                  child: Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 197.h,
                  child: Container(
                    height: 135.h,
                    width: 135.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.charactersModel.image ?? ''),
                      ),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 40.h,
        ),
        child: Container(
          height: 420.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: [
                Text(
                  widget.charactersModel.name ?? '',
                  style: TextHelper.w600s34,
                ),
                Text(
                  statusConverter(widget.charactersModel.status),
                  style: TextStyle(
                    color: statusColorConverter(
                      widget.charactersModel.status,
                    ),
                  ),
                ),
                const Expanded(
                  flex: -1,
                  child: Text(
                      "Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери."),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  flex: -2,
                  child: Container(
                    height: 156,
                    child: Column(
                      children: [
                        const GenderAndSpeciesWidget(
                          firstText: 'Пол',
                          secondText: 'Расса',
                        ),
                        DescriptionWidget(
                          firstText:
                              genderConverter(widget.charactersModel.gender),
                          secondText: speciesConverter(
                            widget.charactersModel.species,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          height: 36.h,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
