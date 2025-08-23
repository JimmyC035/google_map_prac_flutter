import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_map_prac/feature/trtip/ui/pages/trip_provider.dart';

import '../../model/domain/entities/trip.dart';

const String kPlaceholderImage = 'assets/images/placeholder.png';

class MyTripScreen extends ConsumerWidget {
  const MyTripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripListNotifier = ref.watch(tripListNotifierProvider.notifier);
    final tripListState = ref.watch(tripListNotifierProvider);

    if (tripListState.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hi Jimmy 👋', // todo 這裡可以從用戶資料 provider 獲取真實姓名
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Destination...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tripListState.length,
              itemBuilder: (context, index) {
                final trip = tripListState[index];
                return TripCard(
                  trip: trip,
                  onDelete: (tripId) {
                    tripListNotifier.removeTrip(tripId);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final Trip trip;
  final void Function(String tripId) onDelete;

  const TripCard({super.key, required this.trip, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final imageUrl = trip.pictures.isNotEmpty ? trip.pictures[0] : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: imageUrl != null
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          kPlaceholderImage,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        );
                      },
                    )
                  : Image.asset(
                      kPlaceholderImage,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        trip.location,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${trip.date.day} ${trip.date.month} ${trip.date.year}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => onDelete(trip.tripId),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
