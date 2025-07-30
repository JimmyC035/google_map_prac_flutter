import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        controller: _pageController
        children: [
          Text('1')
          Text('2')
          Text('3')
          ],
      ),
    // bottomNavigationBar: BottomNavigationBar(items: items),
    );
  }
}