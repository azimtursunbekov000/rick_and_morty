import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/episodes/data/models/episodes_model.dart';
import 'package:rick_and_morty/features/episodes/domain/use_case/episodes_use_case.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

@injectable
class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final EpisodesUseCase episodesUseCase;
  EpisodesBloc(this.episodesUseCase) : super(EpisodesInitialState()) {
    on<GetAllEpisodes>((event, emit) async {
      try {
        emit(EpisodesLoadingState());
        EpisodesResult episodesResult = await episodesUseCase.getAllEpisodes();

        emit(EpisodesLoadedState(episodesResult: episodesResult));
      } catch (e) {
        emit(EpisodesErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
