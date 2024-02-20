import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';
import 'package:rick_and_morty/features/locations/domain/use_case/location_use_case.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

part 'location_event.dart';
part 'location_state.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationUseCase locationUseCase;
  LocationBloc(this.locationUseCase) : super(LocationsInitialState()) {
    on<GetAllLocations>((event, emit) async {
      try {
        emit(LocationLoadingState());

        LocationResult locationResult = await locationUseCase.getAllLocations();
        emit(LocationLoadedState(locationResult: locationResult));
      } catch (e) {
        print('error bloc $e');
        emit(LocationErrorState(error: CatchException.convertException(e)));
      }
    });

    on<GetResidentEvent>((event, emit) async {
      await locationUseCase
          .getResident(event.locationResultModel)
          .then((residentModel) =>
              emit(ResidentLoadedState(residentsModel: residentModel)))
          .onError((error, stackTrace) => emit(LocationErrorState(
              error: CatchException.convertException(error))));
    });
  }
}
