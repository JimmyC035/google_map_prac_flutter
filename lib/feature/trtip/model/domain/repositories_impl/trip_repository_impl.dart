import 'package:google_map_prac/feature/trtip/model/data/data_sources/trip_local_datasource.dart';
import 'package:google_map_prac/feature/trtip/model/data/repositories/trip_repository.dart';
import 'package:google_map_prac/feature/trtip/model/domain/entities/trip.dart';

import '../../data/models/trip_model.dart';

class TripRepositoryImpl implements TripRepository{

  final TripLocalDataSource localDataSource;

  TripRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async{
    localDataSource.deleteTrip(index);
  }

  @override
  Future<List<Trip>> getTrips() async {
    final tripModels = localDataSource.getTrips();
    List<Trip> res = tripModels.map((model) => model.toEntity()).toList();
    return res;
  }

}