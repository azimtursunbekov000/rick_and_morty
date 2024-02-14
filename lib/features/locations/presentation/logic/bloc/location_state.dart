part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitialState extends LocationState {}

class LocationsLoadingState extends LocationState {}

class LocationsLoadedState extends LocationState {
  final LocationResult locationResult;

  LocationsLoadedState({required this.locationResult});
}

class LocationsErrorState extends LocationState {
  final CatchException error;

  LocationsErrorState({required this.error});
}
