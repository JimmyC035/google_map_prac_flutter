import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_map_prac/feature/trtip/ui/pages/add_trip.dart';
import 'package:google_map_prac/feature/trtip/ui/pages/trip_provider.dart';

import 'my_trip_screen.dart';


class MainScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // 獲取 PageController 和當前頁面索引
    final pageController = ref.watch(pageControllerProvider);
    final currentPageIndex = ref.watch(pageIndexProvider);

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [MyTripScreen(), AddTripScreen(), Text('3')],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "My Trips"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Trips"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Maps"),
        ],
        onTap: (index) {
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
