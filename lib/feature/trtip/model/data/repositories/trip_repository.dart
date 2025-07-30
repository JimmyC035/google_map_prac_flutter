import '../../domain/entities/trip.dart';

abstract class TripRepository {
  Future<Trip> getTrips();

  Future<void> addTrip(Trip trip);

  Future<void> deleteTrip(int index);
}
