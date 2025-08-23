import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_map_prac/feature/trtip/model/data/data_sources/trip_local_datasource.dart';
import 'package:google_map_prac/feature/trtip/model/data/repositories/trip_repository.dart';
import 'package:google_map_prac/feature/trtip/model/domain/repositories_impl/trip_repository_impl.dart';
import 'package:hive/hive.dart';

import '../../model/data/models/trip_model.dart';
import '../../model/domain/entities/trip.dart';
import '../../model/domain/use_cases/add_trip.dart';
import '../../model/domain/use_cases/delete_trip.dart';
import '../../model/domain/use_cases/get_trips.dart';

final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDataSource(tripBox);
});

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepositoryImpl(localDataSource);
});

final addTripProvider = Provider<AddTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTrip(repository);
});

final getTripsProvider = Provider<GetTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTrips(repository);
});

final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrip(repository);
});

final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
      final getTrips = ref.read(getTripsProvider);
      final addTrip = ref.read(addTripProvider);
      final deleteTrip = ref.read(deleteTripProvider);

      return TripListNotifier(getTrips, addTrip, deleteTrip);
    });


// 1. A StateProvider to hold the current page index.
final pageIndexProvider = StateProvider<int>((ref) => 0);

// 2. An autoDispose Provider to manage the PageController's lifecycle.
final pageControllerProvider = Provider.autoDispose<PageController>((ref) {
  final controller = PageController(initialPage: ref.read(pageIndexProvider));

  // Update the page index provider whenever the PageView's page changes.
  controller.addListener(() {
    if (controller.page != null) {
      ref.read(pageIndexProvider.notifier).state = controller.page!.round();
    }
  });

  // Dispose the controller when the provider is no longer used.
  ref.onDispose(() => controller.dispose());

  return controller;
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._deleteTrip) : super([]);

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
  }

  Future<void> removeTrip(String tripId) async {
    await _deleteTrip(tripId);
  }

  Future<void> loadTrips() async {
    await _getTrips();
  }
}
