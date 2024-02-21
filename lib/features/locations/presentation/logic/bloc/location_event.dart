part of 'location_bloc.dart';

@immutable
sealed class LocationEvent {}

class GetAllLocations extends LocationEvent {
  final bool isFirstCall;
  final int page;

  GetAllLocations({
    required this.isFirstCall,
    required this.page,
  });
}

class GetResidentEvent extends LocationEvent {
  final LocationModel locationResultModel;

  GetResidentEvent({required this.locationResultModel});
}
