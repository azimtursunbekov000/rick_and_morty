import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';
import 'package:rick_and_morty/features/locations/domain/use_case/location_use_case.dart';
import 'package:rick_and_morty/internal/helpers/catch_exception.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationUseCase locationUseCase;
  LocationBloc(this.locationUseCase) : super(LocationInitialState()) {
    on<GetAllLocations>((event, emit) async {
      try {
        emit(LocationsLoadingState());

        LocationResult locationResult = await locationUseCase.getAllLocations();
        emit(LocationsLoadedState(locationResult: locationResult));
      } catch (e) {
        print('error bloc $e');
        emit(LocationsErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
