import 'package:google_map_prac/feature/trtip/model/data/repositories/trip_repository.dart';

import '../entities/trip.dart';

class GetTrip{
  final TripRepository repository;

  GetTrip(this.repository);


  Future<Trip> call(){
    return repository.getTrips();
  }
}