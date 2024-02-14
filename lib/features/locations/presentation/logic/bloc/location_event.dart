part of 'location_bloc.dart';

@immutable
sealed class LocationEvent {}

class GetAllLocations extends LocationEvent {}
