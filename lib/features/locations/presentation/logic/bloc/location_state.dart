part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationsInitialState extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationLoadedState extends LocationState {
  final LocationResult locationResult;

  LocationLoadedState({required this.locationResult});
}

class LocationErrorState extends LocationState {
  final CatchException error;

  LocationErrorState({required this.error});
}
