import 'package:hive/hive.dart';

import '../../domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String tripId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final List<String> pictures;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final DateTime date;
  @HiveField(5)
  final String location;

  TripModel({
    required this.tripId,
    required this.title,
    required this.pictures,
    required this.description,
    required this.date,
    required this.location,
  });

  //covert model form entity
  factory TripModel.fromEntity(Trip trip) => TripModel(
    tripId: trip.tripId,
    title: trip.title,
    pictures: trip.pictures,
    description: trip.description,
    date: trip.date,
    location: trip.location,
  );

  // convert model to entity
  Trip toEntity() => Trip(
    tripId: tripId,
    title: title,
    pictures: pictures,
    description: description,
    date: date,
    location: location,
  );
}
