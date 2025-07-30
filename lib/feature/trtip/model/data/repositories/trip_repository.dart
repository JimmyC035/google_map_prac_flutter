import '../../domain/entities/trip.dart';

abstract class TripRepository {
  Future<Trip> getTrips();

  Future<void> addTrips();

  Future<void> deleteTrip();
}
