import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/episodes/data/models/episodes_model.dart';
import 'package:rick_and_morty/features/episodes/domain/repositories/episodes_repository.dart';
@injectable
class EpisodesUseCase {
  final EpisodesRepository episodesRepository;

  EpisodesUseCase({required this.episodesRepository});

  Future<EpisodesResult> getAllEpisodes() async {
    return await episodesRepository.getAllEpisodes();
  }
}
