import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_map_prac/feature/trtip/ui/pages/trip_provider.dart';

import 'add_trip.dart';

class MainScreen extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4')
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (context, pageIndex, child){
            return BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: "My Trips"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    label: "Add Trips"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    label: "Maps"
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
            );
          }),
        );
    }
}