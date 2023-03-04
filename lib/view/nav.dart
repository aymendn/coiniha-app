import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/view/Leaderboard/leaderboard.dart';
import 'package:microhack/view/Profile/profile_screen.dart';
import 'package:microhack/view/Shop/shop.dart';
import 'package:microhack/view/home/home_screen.dart';

class Nav extends HookConsumerWidget {
  const Nav({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    final List<Widget> pages = [
      const HomeScreen(),
      const ShopScreen(),
      const LeaderBoardScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: pages[currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (index) => currentIndex.value = index,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
