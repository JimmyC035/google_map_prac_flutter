import 'package:google_map_prac/feature/trtip/model/data/repositories/trip_repository.dart';
import '../entities/trip.dart';



class AddTrip{
  final TripRepository repository;

  AddTrip(this.repository);

  Future<void> call(Trip trip){
    return repository.addTrip(trip);
  }
}