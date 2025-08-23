import 'package:google_map_prac/feature/trtip/model/data/repositories/trip_repository.dart';



class DeleteTrip{
  final TripRepository repository;

  DeleteTrip(this.repository);

  Future<void> call(String uuid){
    return repository.deleteTrip(uuid);
  }
}