part of 'location_bloc.dart';

@immutable
sealed class LocationEvent {}

class GetAllLocations extends LocationEvent {}

class GetResidentEvent extends LocationEvent {
  final LocationModel locationResultModel;

  GetResidentEvent({required this.locationResultModel});
}
