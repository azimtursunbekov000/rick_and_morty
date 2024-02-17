import 'package:rick_and_morty/features/episodes/data/models/episodes_model.dart';

abstract class EpisodesRepository {
  ///RU: получение всех эпизодов
  ///
  ///EN: get all episodes

  Future<EpisodesResult> getAllEpisodes();
}
