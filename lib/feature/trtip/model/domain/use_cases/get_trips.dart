import 'package:google_map_prac/feature/trtip/model/data/repositories/trip_repository.dart';

import '../entities/trip.dart';

class GetTrips{
  final TripRepository repository;

  GetTrips(this.repository);


  Future<List<Trip>> call(){
    return repository.getTrips();
  }
}