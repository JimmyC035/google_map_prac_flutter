import '../models/trip_model.dart';
import 'package:hive_flutter/hive_flutter.dart';


class TripLocalDataSource{
  final Box<TripModel> tripBox;

  TripLocalDataSource(this.tripBox);

  List<TripModel> getTrips(){
    return tripBox.values.toList();
  }

  void addTrip(TripModel trip){
    tripBox.add(trip);
  }
  void deleteTrip(String uuid){
    tripBox.delete(uuid);
  }

}